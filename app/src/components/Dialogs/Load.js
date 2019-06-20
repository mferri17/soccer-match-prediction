import React from "react";
import Button from "@material-ui/core/Button";
import Avatar from '@material-ui/core/Avatar';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemAvatar from '@material-ui/core/ListItemAvatar';
import ListItemText from '@material-ui/core/ListItemText';
import ListItemSecondaryAction from '@material-ui/core/ListItemSecondaryAction';
import IconButton from '@material-ui/core/IconButton';
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogTitle from "@material-ui/core/DialogTitle";
import PersonIcon from '@material-ui/icons/Person';
import DeleteIcon from '@material-ui/icons/Delete';
import { connect, actions } from "../../store";

const SaveDialog = React.memo(({ open, onClose, configs }) => (
  <Dialog open={open} onClose={onClose} aria-labelledby="load-config">
    <DialogTitle>Load config</DialogTitle>
    <List>
      {configs.map(config => (
        <ListItem
          key={config.name}
          button
          onClick={() => {
            actions.load(config);
            onClose();
          }}
        >
          <ListItemAvatar>
            <Avatar>
              <PersonIcon />
            </Avatar>
          </ListItemAvatar>
          <ListItemText primary={config.name} />
          <ListItemSecondaryAction>
            <IconButton
              edge="end"
              aria-label="Delete"
              onClick={() => {
                actions.deleteConfig(config)
              }}
            >
              <DeleteIcon />
            </IconButton>
          </ListItemSecondaryAction>
        </ListItem>
      ))}
    </List>
    <DialogActions>
      <Button onClick={onClose} color="primary">
        Cancel
      </Button>
    </DialogActions>
  </Dialog>
));

export default connect(({ configs }) => ({ configs }))(SaveDialog);
