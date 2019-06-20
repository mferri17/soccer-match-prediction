import React, { useState, useMemo, useCallback } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';
import Field from './Field';
import TeamDetail from './TeamDetail';
import MatchResult from './MatchResult';
import { connect } from '../store';
import { isMatchValid } from '../utils';

const LinkTab = props => (
  <Tab
    component="a"
    onClick={event => {
      event.preventDefault();
    }}
    {...props}
  />
);

const useStyles = makeStyles(theme => ({
  root: {
    flexGrow: 1,
    backgroundColor: theme.palette.background.paper,
  },
  tabContainer: {
    minHeight: 'calc(100vh - 112px)',
    height: '100%',
    width: '100vw',
    maxWidth: '100%',
    display: 'flex',
    flexDirection: 'row'
  },
  tabContent: {
    padding: 24,
    width: 'calc(100% - 48px)'
  }
}));

const TeamTabs = ({ teams }) => {
  const classes = useStyles();
  const [value, setValue] = useState(0);

  const PlayerProps = useMemo(() => ({
    primaryColor: value === 0 ? 'white' : 'blue' ,
    secondaryColor: value === 0 ? 'black' : 'yellow' ,
    accentColor: value === 0 ? 'gray' : 'orange' ,
  }), [value]);

  const handleChange = useCallback((_, newValue) => {
    setValue(newValue);
  }, [setValue]);

  const selectedTeam = teams[value];

  return (
    <div className={classes.root}>
      <AppBar position="static" elevation={0}>
        <Tabs variant="fullWidth" value={value} onChange={handleChange}>
          <LinkTab label="Home Team" href="/home-team" />
          <LinkTab label="Away Team" href="/away-team" />
          <LinkTab
            label="Results"
            href="/results"
            disabled={!isMatchValid(teams)}
          />
        </Tabs>
      </AppBar>
      <div className={classes.tabContainer}>
        {value !== 2 && <Field team={selectedTeam} PlayerProps={PlayerProps}/>}
        <div className={classes.tabContent}>
          {
            value < 2
              ? <TeamDetail team={selectedTeam} />
              : <MatchResult />
          }
        </div>
      </div>
    </div>
  );
};

export default connect(({ teams }) => ({ teams }))(TeamTabs);
