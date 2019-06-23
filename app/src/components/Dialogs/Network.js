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
  'terrible',
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

const winnerMenuItems = [
  <MenuItem value={null} />,
  <MenuItem value="home">home</MenuItem>,
  <MenuItem value="not home">not home</MenuItem>
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
    { source: 'away_mid', target: 'winner' },
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

const initialState = {
  loading: false,
  result: null,
  query: {
    name: null,
    value: null
  },
  nodes: graphData.nodes.reduce((acc, cur) => ({
    ...acc,
    [cur.id]: null
  }), {})
};

const reducer = (state, action) => {
  switch (action.type) {
    case 'set-value':
      return {
        ...state,
        result: null,
        nodes: {
          ...state.nodes,
          [action.nodeId]: action.value
        },
        query: state.query.name !== action.nodeId
          ? state.query
          : initialState.query
      };
    case 'set-query-name':
      return {
        ...state,
        result: null,
        query: {
          ...state.query,
          name: action.value,
          value: action.value === state.query.name
            ? state.query.value
            : null
        }
      };
    case 'set-query-value':
      return {
        ...state,
        result: null,
        query: {
          ...state.query,
          value: action.value
        }
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
        result: action.value,
        loading: false
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
  },
  prob: {
    fontWeight: 'bold',
    fontFamily: 'Roboto',
    marginTop: 16
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
        ...store.nodes,
        query_name: store.query.name,
        query_value: store.query.value
      })
    })
      .then(response => response.json())
      .then(value => {
        dispatch({
          type: 'set-result',
          value
        });
      });
  }, [store.loading]);

  const getFieldValue = id => store.nodes[id];

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
          disabled={store.loading}
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
        nodeColor={node => {
          if (!!getFieldValue(node.id)) return 'red';
          if (store.query.name === node.id) return 'green';

          return undefined;
        }}
      />
      <div
        className={classes.formContainer}
        style={{
          width: width / 2
        }}
      >
        <div className={classes.column}>
          <Typography variant="h5" className={classes.title}>
            Evidence
          </Typography>
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
                  disabled={store.loading}
                >
                  {winnerMenuItems}
                </Select>
              </FormControl>
            </div>
          </div>
          <Typography variant="h5" className={classes.title}>
            Query
          </Typography>
          <div className={classes.row}>
            <FormControl className={classes.formControl}>
              <InputLabel htmlFor="variable">Variable</InputLabel>
              <Select
                value={store.query.name}
                onChange={e => {
                  dispatch({
                    type: 'set-query-name',
                    value: e.target.value
                  });
                }}
                inputProps={{
                  name: 'variable',
                  id: 'variable',
                }}
              >
                {
                  [
                    <MenuItem value={null} />,
                    ...Object.keys(store.nodes)
                        .filter(x => !getFieldValue(x))
                        .map(key => (
                          <MenuItem value={key}>{key}</MenuItem>
                        ))
                  ]
                }
              </Select>
            </FormControl>
            <FormControl className={classes.formControl}>
              <InputLabel htmlFor="value">Value</InputLabel>
              <Select
                value={store.query.value}
                onChange={e => {
                  dispatch({
                    type: 'set-query-value',
                    value: e.target.value
                  });
                }}
                inputProps={{
                  name: 'value',
                  id: 'value',
                }}
              >
                {
                  store.query.name === 'winner'
                    ? winnerMenuItems
                    : menuItems
                }
              </Select>
            </FormControl>
          </div>
          <div className={classes.formFooter}>
            <Button
              variant="contained"
              color="primary"
              disabled={!store.query.name || !store.query.value || store.loading}
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
          {
            store.result !== null && (
              <Typography variant="p" className={classes.prob}>
                P({store.query.name} = {store.query.value} | {
                  Object.keys(store.nodes)
                    .filter(key => store.nodes[key])
                    .map(id => `${id} = ${store.nodes[id]}`)
                    .join(', ')
                }) = {store.result}
              </Typography>
            )
          }
        </div>
      </div>
    </div>
  );
};

export default Network;