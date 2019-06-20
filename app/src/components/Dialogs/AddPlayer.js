import React, { useCallback } from 'react';
import Button from '@material-ui/core/Button';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogTitle from '@material-ui/core/DialogTitle';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import ListItemAvatar from '@material-ui/core/ListItemAvatar';
import Avatar from '@material-ui/core/Avatar';
import Person from '@material-ui/icons/Person';
import { FixedSizeList } from 'react-window';
import { connect, actions } from '../../store';

const AddPlayerDialog = React.memo(({ open, onClose, team, availablePlayers }) => {
  const onAdd = useCallback(player => {
    actions.addPlayer({ player, team });
    onClose();
  }, [team, onClose, actions]);

  const Row = useCallback(({ data, index, style }) => {
    const player = data[index];
    const {
      id,
      player_name,
      height,
      weight
    } = player;
  
    return (
      <ListItem
        key={id}
        style={style}
        onClick={() => {
          onAdd(player);
        }}
        button
      >
        <ListItemAvatar>
          <Avatar>
            <Person />
          </Avatar>
        </ListItemAvatar>
        <ListItemText
          primary={player_name}
          // weight is in libs
          secondary={`${height} cm - ${Math.round(weight * 0.45359 * 100) / 100} kg`}
        />
      </ListItem>
    );
  }, [onAdd]);

  return (
    <Dialog open={open} onClose={onClose} aria-labelledby="add-player">
      <DialogTitle>Add player</DialogTitle>
      <FixedSizeList
        height={400}
        width={360}
        itemSize={46}
        itemData={availablePlayers}
        itemCount={availablePlayers.length}
      >
        {Row}
      </FixedSizeList>
      <DialogActions>
        <Button onClick={onClose} color="primary">
          Cancel
        </Button>
      </DialogActions>
  </Dialog>
  );
});

export default connect(({ availablePlayers }) => ({ availablePlayers }))(AddPlayerDialog);
