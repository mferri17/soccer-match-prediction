import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import FieldImg from '../assets/soccer-field.jpg';
import { range } from '../utils'
import FieldCell from './FieldCell';

const gridDimension = [14, 14];

const useStyles = makeStyles({
  root: {
    position: 'relative'
  },
  img: {
    height: 'calc(100vh - 112px)',
    width: 'auto',
    userDrag: 'none',
    userSelect: 'none'
  },
  grid: {
    width: '100%',
    height: '100%',
    position: 'absolute',
    top: 0,
    left: 0,
    display: 'flex',
    justifyContent: 'space-around',
    flexFlow: `row wrap`,
  },
  gridItem: {
    height: `${100 / gridDimension[0]}%`,
    width: `${100 / gridDimension[1]}%`,
    display: 'flex',
    justifyContent: 'center',
    flexDirection: 'column',
    position: 'relative'
  }
});

const Field = ({ team, PlayerProps }) => {
  const classes = useStyles();
  
  return (
    <div className={classes.root}>
      <img src={FieldImg} className={classes.img} alt="soccer field"/>
      <div className={classes.grid}>
          {
            range(gridDimension[0])
              .map(y =>
                  range(gridDimension[1]).map(x => {
                    const cellY = gridDimension[0] - y - 1;
                    const cellX = x;

                    return (
                      <FieldCell
                        key={`${y}-${x}`}
                        x={cellX}
                        y={cellY}
                        team={team}
                        PlayerProps={PlayerProps}
                        className={classes.gridItem}
                      />
                    );
                  })
              )
              .flat()
          }
      </div>
    </div>
  );
};

export default Field;