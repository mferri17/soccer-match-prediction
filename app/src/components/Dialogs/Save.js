import React, { useState, useCallback } from 'react';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
import { connect, actions } from '../../store';

const SaveDialog = React.memo(({ open, onClose, teams }) => {
  const [name, setName] = useState('');
  const onSave = useCallback(() => {
    actions.save({ name, teams });
    onClose();
  }, [name, teams, onClose, actions]);

  return (
    <Dialog open={open} onClose={onClose} aria-labelledby="save-config">
      <DialogTitle>Save config</DialogTitle>
      <DialogContent>
        <DialogContentText>
          Save your configuration and load it later.
        </DialogContentText>
        <TextField
          autoFocus
          margin="dense"
          id="name"
          label="Name"
          type="text"
          fullWidth
          onChange={e => {
            setName(e.target.value)
          }}
        />
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">
          Cancel
        </Button>
        <Button
          onClick={onSave}
          color="primary"
          disabled={!name}
        >
          Save
        </Button>
      </DialogActions>
    </Dialog>
  );
});

export default connect(({ teams }) => ({ teams }))(SaveDialog);
