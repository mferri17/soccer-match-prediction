import React, { useState, useCallback, useMemo } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import ListItemAvatar from '@material-ui/core/ListItemAvatar';
import ListItemSecondaryAction from '@material-ui/core/ListItemSecondaryAction';
import Avatar from '@material-ui/core/Avatar';
import IconButton from '@material-ui/core/IconButton';
import Person from '@material-ui/icons/Person';
import DeleteIcon from '@material-ui/icons/Delete';
import Add from '@material-ui/icons/Add';
import AddPlayer from './Dialogs/AddPlayer';
import { actions } from '../store';

const useStyles = makeStyles(theme => ({
  playerList: {
    width: '100%',
    maxWidth: 360,
    backgroundColor: theme.palette.background.paper,
  },
  listsContainer: {
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between',
    width: '100%'
  }
}));

const PlayerList = ({ team }) => {
  const { players } = team;

  const classes = useStyles();
  const [isNewPlayerOpen, setDialog] = useState(false);

  const openDialog = useCallback(() => {
    setDialog(true);
  }, [setDialog]);

  const closeDialog = useCallback(() => {
    setDialog(false);
  }, [setDialog]);

  const playersLists = useMemo(() => {
    const chunks = [];
    const playerz = [
      ...players, 
      players.length < 11 && (
        <ListItem key="new" onClick={openDialog} button>
          <ListItemAvatar>
            <Avatar>
              <Add />
            </Avatar>
          </ListItemAvatar>
          <ListItemText primary="Add player" />
        </ListItem>
      ),
      ...[...new Array(10).keys()].map(() => null)
    ];

    while (chunks.length < 2) chunks.push(playerz.splice(0, 4));

    chunks.push(playerz.splice(0, 3));

    return chunks.map((chunk, i) => (
      <List key={i} className={classes.playerList}>
        {chunk.map(player => (
          player && React.isValidElement(player)
            ? player
            : player && (
              <ListItem key={player.id}>
                <ListItemAvatar>
                  <Avatar>
                    <Person />
                  </Avatar>
                </ListItemAvatar>
                <ListItemText
                  primary={player.player_name}
                  secondary={`Rating: ${player.overall_rating}`}
                />
                <ListItemSecondaryAction>
                  <IconButton
                    edge="end"
                    aria-label="Delete"
                    onClick={() => {
                      actions.removePlayer({
                        team,
                        player
                      })
                    }}
                  >
                    <DeleteIcon />
                  </IconButton>
                </ListItemSecondaryAction>
              </ListItem>
            )
        ))}
      </List>
    ));
  }, [players, actions, classes]);

  return (
    <>
      <div className={classes.listsContainer}>
        {playersLists}
      </div>
      <AddPlayer open={isNewPlayerOpen} onClose={closeDialog} team={team} />
    </>
  );
};

export default PlayerList;
