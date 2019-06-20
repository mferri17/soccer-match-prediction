import React, { useCallback, useMemo } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import MenuItem from '@material-ui/core/MenuItem';
import FormControl from '@material-ui/core/FormControl';
import Select from '@material-ui/core/Select';
import Typography from '@material-ui/core/Typography';
import PlayerList from './PlayerList';
import { connect, actions } from '../store';
import { getTeamName } from '../utils';

const useStyles = makeStyles(theme => ({
  title: {
    margin: theme.spacing(4, 0, 2),
  }
}));

const TeamDetail = ({ availableTeams, team }) => {
  const { teamInfo: { id: teamId } } = team;
  const classes = useStyles();

  const teamsMenuItems = useMemo(() => (
      [
        <MenuItem value="none" disabled>
          Select Team
        </MenuItem>,
        ...availableTeams
          .sort((t1, t2) => {
            if (t1.team_long_name < t2.team_long_name)
              return -1;
            if (t1.team_long_name > t2.team_long_name)
              return 1;
            
            return 0;
          })
          .map(x => (
            <MenuItem value={x.id}>{getTeamName(x)}</MenuItem>
          ))
      ]
    ),
    [availableTeams]
  );

  const onTeamChange = useCallback(e => {
    actions.changeTeam(team, e.target.value);
  }, [actions, team]);

  return (
    <>
      <Typography variant="h6" className={classes.title}>
        Team
      </Typography>
      <FormControl>
        <Select
          value={teamId || 'none'}
          onChange={onTeamChange}
          inputProps={{
            name: 'team-id',
            id: 'team-id',
          }}
        >
          {teamsMenuItems}
        </Select>
    </FormControl>
    <Typography variant="h6" className={classes.title}>
      Players
    </Typography>
    <PlayerList team={team} />
  </>
  );
};

export default connect(({ availableTeams }) => ({ availableTeams }))(TeamDetail);
