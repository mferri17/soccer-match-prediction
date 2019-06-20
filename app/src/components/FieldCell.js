import React from 'react';
import { useDrop } from 'react-dnd';
import Player from './Player';
import Overlay from './Overlay';
import itemTypes from './itemTypes';
import { canMovePlayer } from '../utils';
import { actions } from '../store';

const FieldCell = ({ x, y, className, PlayerProps, team }) => {
  const player = team.players.find(player => {
    const { x: px, y: py } = player;

    // goalkeeper
    if (px === 1 && py === 1) {
      return x === 6 && y === 1;
    }

    return py === y && px === x;
  });

  const [{ isOver, canDrop }, drop] = useDrop({
    accept: itemTypes.PLAYER,
    canDrop: () => canMovePlayer(x, y, team),
    drop: (item) => actions.updatePlayer({
      team,
      oldPlayer: item.data,
      newPlayer: {
        ...item.data,
        // goalkeeper is always in [1;1]
        x: y === 1 ? 1 : x,
        y
      }
    }),
    collect: monitor => ({
      isOver: !!monitor.isOver(),
      canDrop: !!monitor.canDrop(),
    }),
  });

  return (
    <div
      ref={drop}
      className={className}
    >
      {player && <Player data={player} {...PlayerProps}/>}
      {isOver && !canDrop && <Overlay color="red" />}
      {isOver && canDrop && <Overlay color="green" />}
    </div>
  );
};

export default FieldCell;