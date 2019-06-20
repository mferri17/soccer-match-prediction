import React, { useEffect } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import CircularProgress from '@material-ui/core/CircularProgress';
import Typography from '@material-ui/core/Typography';
import { connect, actions } from '../store';
import { getTeamName } from '../utils';

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
                  {getTeamName(homeTeam.teamInfo)}
                </Typography>
                <Typography className={classes.vsLabel}>
                  vs
                </Typography>
                <Typography
                  className={classes.teamName}
                  style={getColor(results[1])}
                >
                  {getTeamName(awayTeam.teamInfo)}
                </Typography>
                <Typography className={classes.probabilityText}>
                  Prediction assigned exactly {'<'}{results[0]}, {results[1]}{'>'} probabilities.
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
