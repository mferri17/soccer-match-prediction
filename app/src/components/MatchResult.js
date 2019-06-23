import React, { useEffect } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import CircularProgress from '@material-ui/core/CircularProgress';
import Typography from '@material-ui/core/Typography';
import { connect, actions } from '../store';

const useStyles = makeStyles({
  root: {
    height: '100%',
    width: '100%',
    display: 'flex',
    justifyContent: 'center',
    flexDirection: 'row'
  },
  column: {
    display: 'flex',
    justifyContent: 'center',
    flexDirection: 'column',
    alignItems: 'center'
  },
  teamName: {
    color: '#C0C0C0',
    fontSize: 52
  },
  vsLabel: {
    color: '#C0C0C0',
    fontSize: 36
  },
  probabilityText: {
    color: '#C0C0C0',
    fontSize: 22,
    marginTop: 16
  }
});

const getColor = perc => ({
  color: perc > 0.5 ? '#4CAF50' : '#F44336'
});

const MatchResult = ({ teams: [homeTeam, awayTeam], results }) => {
  const classes = useStyles();

  useEffect(() => {
    actions.computeResults();

    return () => actions.resetResults();
  }, []);

  return (
    <div className={classes.root}>
      <div className={classes.column}>
        {
          !!results
            ? (
              <>
                <Typography
                  className={classes.teamName}
                  style={getColor(results[0])}
                >
                  Home team
                </Typography>
                <Typography className={classes.vsLabel}>
                  vs
                </Typography>
                <Typography
                  className={classes.teamName}
                  style={getColor(results[1])}
                >
                  Away team
                </Typography>
                <Typography className={classes.probabilityText}>
                  Prediction assigned exactly {'<'}{results[0]}, {results[1]}{'>'} probabilities (Home, not Home).
                </Typography>
              </>
            ) : (
              <CircularProgress className={classes.progress} />
            )
        }
      </div>
    </div>
  );
};

export default connect(({ teams, results }) => ({ teams, results }))(MatchResult);
