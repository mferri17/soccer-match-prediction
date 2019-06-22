import React, { useCallback, useState, useReducer, useEffect } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import { ForceGraph2D } from 'react-force-graph';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import InputLabel from '@material-ui/core/InputLabel';
import MenuItem from '@material-ui/core/MenuItem';
import FormControl from '@material-ui/core/FormControl';
import Select from '@material-ui/core/Select';
import { getURL } from '../../utils';

const rolePrefixes = [
  '_gk',
  '_def',
  '_mid',
  '_atk'
];

const levels = [
  'very bad',
  'bad',
  'mediocre',
  'good',
  'very good',
  'excellent'
];

const menuItems = [
  <MenuItem value={null} />,
  ...levels.map(level => <MenuItem value={level}>{level}</MenuItem>)
];

const graphData = {
  nodes: [
    { id: 'winner' },
    { id: 'home_gk' },
    { id: 'home_def' },
    { id: 'home_mid' },
    { id: 'home_atk' },
    { id: 'away_gk' },
    { id: 'away_def' },
    { id: 'away_mid' },
    { id: 'away_atk' }
  ],
  links: [
    { source: 'home_mid', target: 'winner' },
    { source: 'away_def', target: 'winner' },
    { source: 'home_def', target: 'home_gk' },
    { source: 'home_mid', target: 'home_gk' },
    { source: 'home_def', target: 'home_atk' },
    { source: 'home_mid', target: 'home_atk' },
    { source: 'home_def', target: 'home_mid' },
    { source: 'away_def', target: 'away_gk' },
    { source: 'away_mid', target: 'away_gk' },
    { source: 'away_def', target: 'away_atk' },
    { source: 'away_mid', target: 'away_atk' },
    { source: 'away_def', target: 'away_mid' }
  ]
};

const initialState = graphData.nodes.reduce((acc, cur) => ({
  ...acc,
  [cur]: null
}), {
  loading: false,
  submitted: false
});

const reducer = (state, action) => {
  switch (action.type) {
    case 'set-value':
      return {
        ...state,
        [action.nodeId]: action.value
      };
    case 'reset':
      return {
        ...initialState
      };
    case 'compute':
      return {
        ...state,
        loading: true
      };
    case 'set-result':
      return {
        ...state,
        result: action.values,
        loading: false,
        submitted: true
      };
    default:
      throw new Error();
  }
};

const useStyles = makeStyles(theme => ({
  root: {
    width: '100%',
    height: '100%',
    display: 'flex',
    flexDirection: 'row'
  },
  formContainer: {
    display: 'flex',
    flexDirection: 'row',
    paddingLeft: 16,
    paddingRight: 16
  },
  title: {
    margin: theme.spacing(4, 0, 2),
  },
  form: {
    width: '50%'
  },
  formFooter: {
    width: '100%',
    marginTop: 20,
    marginLeft: 8
  },
  row: {
    display: 'flex',
    flexDirection: 'row'
  },
  column: {
    width: '100%',
    display: 'flex',
    flexDirection: 'column'
  },
  formControl: {
    margin: theme.spacing(1),
    minWidth: 120,
  },
  resetButton: {
    marginLeft: 16
  }
}));

const Network = () => {
  const classes = useStyles();
  const [{ height, width }, setDimensions] = useState({
    height: 0,
    width: 0
  });
  const [store, dispatch] = useReducer(reducer, initialState);

  useEffect(() => {
    if (!store.loading) {
      return;
    }

    fetch(getURL('inference'), {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        ...store,
        loading: undefined,
        submitted: undefined
      })
    })
      .then(response => response.json())
      .then(nodes => {
        dispatch({
          type: 'set-result',
          values: nodes
        });
      });
    // TODO : fetch
  }, [store.loading]);

  const getFieldValue = id => store.result && store.result[id] || store[id];

  const measuredRef = useCallback(node => {
    if (node !== null) {
      const boundingClientRect = node.getBoundingClientRect();
      setDimensions({
        height: boundingClientRect.height,
        width: boundingClientRect.width
      });
    }
  }, []);

  const getSelects = useCallback(type => pref => {
    const id = `${type}${pref}`;

    return (
      <FormControl className={classes.formControl}>
        <InputLabel htmlFor={id}>{id}</InputLabel>
        <Select
          value={getFieldValue(id)}
          onChange={e => {
            dispatch({
              type: 'set-value',
              nodeId: id,
              value: e.target.value
            });
          }}
          inputProps={{
            name: id,
            id,
          }}
          disabled={store.submitted || store.loading}
        >
          {menuItems}
        </Select>
      </FormControl>
    );
  }, [classes, store]);

  return (
    <div
      className={classes.root}
      ref={measuredRef}
    >
      <ForceGraph2D
        graphData={graphData}
        width={width / 2}
        height={height}
        nodeLabel="id"
        backgroundColor="#F7F7F7"
        linkDirectionalArrowLength={7}
        linkDirectionalArrowRelPos={1}
        nodeColor={node => getFieldValue(node.id) ? 'red' : undefined}
      />
      <div
        className={classes.formContainer}
        style={{
          width: width / 2
        }}
      >
        <div className={classes.column}>
          <div className={classes.row}>
            <div className={classes.form}>
              <Typography variant="h6" className={classes.title}>
                Home team
              </Typography>
              {rolePrefixes.map(getSelects('home'))}
            </div>
            <div className={classes.form}>
              <Typography variant="h6" className={classes.title}>
                Away team
              </Typography>
              {rolePrefixes.map(getSelects('away'))}
            </div>
            <div className={classes.form}>
              <Typography variant="h6" className={classes.title}>
                Winner
              </Typography>
              <FormControl className={classes.formControl}>
                <InputLabel htmlFor="winner">winner</InputLabel>
                <Select
                  value={getFieldValue('winner')}
                  onChange={e => {
                    dispatch({
                      type: 'set-value',
                      nodeId: 'winner',
                      value: e.target.value
                    });
                  }}
                  inputProps={{
                    name: 'winner',
                    id: 'winner',
                  }}
                  disabled={store.submitted || store.loading}
                >
                  <MenuItem value={null} />
                  <MenuItem value="home">home</MenuItem>
                  <MenuItem value="away">away</MenuItem>
                </Select>
              </FormControl>
            </div>
          </div>
          <div className={classes.formFooter}>
            <Button
              variant="contained"
              color="primary"
              disabled={store.submitted || store.loading}
              onClick={() => {
                dispatch({
                  type: 'compute'
                });
              }}
            >
              Compute
            </Button>
            <Button
              variant="contained"
              color="secondary"
              className={classes.resetButton}
              onClick={() => {
                dispatch({
                  type: 'reset'
                });
              }}
            >
              Reset
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Network;