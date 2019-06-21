import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import PlayerList from './PlayerList';
import { connect } from '../store';

const useStyles = makeStyles(theme => ({
  title: {
    margin: theme.spacing(4, 0, 2),
  }
}));

const TeamDetail = ({ team }) => {
  const classes = useStyles();

  return (
    <>
    <Typography variant="h6" className={classes.title}>
      Players
    </Typography>
    <PlayerList team={team} />
  </>
  );
};

export default TeamDetail;
