import React, { useState, useCallback } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import IconButton from '@material-ui/core/IconButton';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import Save from '@material-ui/icons/Save';
import CloudDownload from '@material-ui/icons/CloudDownload';
import Settings from '@material-ui/icons/Settings';
import SaveDialog from './Dialogs/Save';
import LoadDialog from './Dialogs/Load';
import ManualPredictionDialog from './Dialogs/ManualPrediction';

const DIALOGS = {
  SAVE: 0,
  LOAD: 1,
  MANUAL_PREDICTION: 2
};

const useStyles = makeStyles({
  root: {
    flexGrow: 1,
  },
  title: {
    flexGrow: 1,
  },
});

const SoccerAppBar = () => {
  const classes = useStyles();
  const [dialog, setDialog] = useState(null);

  const openSave = useCallback(() => {
    setDialog(DIALOGS.SAVE);
  }, [setDialog]);

  const openLoad = useCallback(() => {
    setDialog(DIALOGS.LOAD);
  }, [setDialog]);

  const openManualPrediction = useCallback(() => {
    setDialog(DIALOGS.MANUAL_PREDICTION);
  }, [setDialog]);

  const closeDialog = useCallback(() => {
    setDialog(null);
  }, [setDialog]);

  return (
    <div className={classes.root}>
      <AppBar position="static" elevation={0}>
        <Toolbar>
          <Typography variant="h6" className={classes.title}>
            Soccer match prediction
          </Typography>
          <IconButton
            aria-label="manual-prediction"
            color="inherit"
            onClick={openManualPrediction}
          >
            <Settings />
          </IconButton>
          <IconButton
            aria-label="Load"
            color="inherit"
            onClick={openLoad}
          >
            <CloudDownload />
          </IconButton>
          <IconButton
            aria-label="Save"
            color="inherit"
            onClick={openSave}
          >
            <Save />
          </IconButton>
        </Toolbar>
      </AppBar>
      <SaveDialog
        onClose={closeDialog}
        open={dialog === DIALOGS.SAVE}
      />
      <LoadDialog
        onClose={closeDialog}
        open={dialog === DIALOGS.LOAD}
      />
      <ManualPredictionDialog
        onClose={closeDialog}
        open={dialog === DIALOGS.MANUAL_PREDICTION}
      />
    </div>
  );
};

export default SoccerAppBar;
