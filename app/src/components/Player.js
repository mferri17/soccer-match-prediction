import React from "react";
import { useDrag } from 'react-dnd';
import { makeStyles } from '@material-ui/core/styles';
import Tooltip from '@material-ui/core/Tooltip';
import itemTypes from './itemTypes';

const useStyles = makeStyles({
  root: {
    cursor: 'all-scroll'
  }
});

const Player = ({
  data,
  primaryColor,
  secondaryColor,
  accentColor
}) => {
  const classes = useStyles();
  const [_, drag] = useDrag({
    item: {
      type: itemTypes.PLAYER,
      data
    }
  });
  
  return (
    <div ref={drag} className={classes.root}>
      <Tooltip title={data.player_name}>
        <svg
          version="1.1"
          xmlns="http://www.w3.org/2000/svg"
          xmlnsXlink="http://www.w3.org/1999/xlink"
          x="0px"
          y="0px"
          viewBox="0 0 495.996 495.996"
          style={{ enableBackground: 'new 0 0 495.996 495.996' }}
          xmlSpace="preserve"
        >
          <g>
            <path
              style={{ fill: '#E6B47D' }}
              d="M456.114,406.405l-0.116,0.052v-7.534c0-35.591-23.513-66.902-57.692-76.827l-62.308-18.092
                      c-1.129,1.169-2.252,2.317-3.372,3.456c-11.416-10.372-12.696-31.422-12.714-43.686c10.899-11.858,19.563-26.181,26.004-41.591
                      c16.124,10.733,30.082-23.27,30.082-38.111c0-10.909-6.446-17.166-16.681-16.694c0.454-5.169,0.681-10.286,0.681-15.306
                      c0-64.065-50.144-80.009-112-80.009s-112,15.944-112,80.009c0,5.063,0.232,10.225,0.693,15.439
                      c-10.188-1.195-16.693,5.117-16.693,16.561c0,15.462,13.88,51.714,29.424,36.513c6.499,16.003,15.378,30.888,26.638,43.149
                      c-0.067,12.218-1.45,33.204-12.791,43.623c-1.087-1.105-2.176-2.22-3.271-3.354l-62.307,18.093
                      c-34.179,9.925-57.692,41.236-57.692,76.827v7.534l-0.116-0.052c-3.692-1.678-7.884,1.021-7.884,5.077v10.676
                      c0,4.281,2.502,8.166,6.399,9.938l9.601,4.364v35.536c0,13.255,10.745,24,24,24h352c13.255,0,24-10.745,24-24V436.46l9.601-4.364
                      c3.897-1.771,6.399-5.657,6.399-9.938v-10.676C463.998,407.426,459.806,404.726,456.114,406.405z"
            />
            <path
              style={{ fill: '#D2A073' }}
              d="M303.998,344.004l31.671-34.197c-17.891-11.519-15.671-45.803-15.671-53.803h-144
                      C186.33,285.707,254.665,336.67,303.998,344.004z"
            />
            <path
              style={{ fill: '#F0C891' }}
              d="M359.318,167.378c0.454-5.169,0.681-10.286,0.681-15.306c0-64.065-50.144-80.009-112-80.009
                      s-112,15.944-112,80.009c0,5.063,0.232,10.225,0.693,15.439c-10.188-1.195-16.693,5.117-16.693,16.561
                      c0,15.462,13.88,51.714,29.424,36.513c16.834,41.451,49.566,75.487,98.576,75.487c48.379,0,80.897-33.165,97.918-73.889
                      c16.124,10.733,30.082-23.27,30.082-38.111C375.998,173.163,369.553,166.907,359.318,167.378z"
            />
            <path
              style={{ fill: primaryColor }}
              d="M335.998,304.004c-47.662,49.343-88,72-88,72s-40.338-22.657-88-72l-62.307,18.092
                      c-34.179,9.924-57.692,41.236-57.692,76.827v20.717l80,36.364v39.991h256v-39.991l80-36.364v-20.717
                      c0-35.591-23.513-66.902-57.692-76.827L335.998,304.004z"
            />
            <path
              style={{ fill: secondaryColor }}
              d="M447.998,424.004h-16v-25.082c0-24.758-16.605-46.875-40.383-53.777l-53.137-15.43l4.461-15.367
                      l53.137,15.43c30.57,8.879,51.922,37.313,51.922,69.145V424.004z M63.999,424.004h-16v-25.082
                      c0-31.832,21.352-60.266,51.922-69.145l53.137-15.43l4.461,15.367l-53.137,15.43c-23.777,6.902-40.383,29.02-40.383,53.777
                      C63.999,398.921,63.999,424.004,63.999,424.004z"
            />
            <path
              style={{ fill: accentColor }}
              d="M38.397,432.095l81.601,37.092v-26.365l-80.116-36.417c-3.692-1.678-7.884,1.021-7.884,5.077v10.676
                      C31.999,426.438,34.5,430.323,38.397,432.095z"
            />
            <path
              style={{ fill: accentColor }}
              d="M457.6,432.095l-81.601,37.092v-26.365l80.116-36.417c3.692-1.678,7.884,1.021,7.884,5.077v10.676
                      C463.998,426.438,461.497,430.323,457.6,432.095z"
            />
            <path
              style={{ fill: accentColor }}
              d="M335.998,304.004c-47.662,49.343-88,72-88,72s-40.338-22.657-88-72l-26.537,7.706
                      c54.978,57.081,100.496,83.894,102.482,85.048l12.055,7l12.055-7c1.986-1.154,47.504-27.968,102.482-85.048L335.998,304.004z"
            />
            <path
              style={{ fill: secondaryColor }}
              d="M335.998,439.995h-48c-4.418,0-8,3.582-8,8v8c0,18.755,5.337,31.452,11.639,40h40.723
                      c6.301-8.548,11.639-21.245,11.639-40v-8C343.998,443.577,340.417,439.995,335.998,439.995z"
            />
            <path
              style={{ fill: accentColor }}
              d="M317.096,495.995c8.332-15.066,10.902-32.132,10.902-40h-16h-16c0,7.868,2.571,24.934,10.902,40
                      H317.096z"
            />
            <path
              style={{ fill: '#64464B' }}
              d="M359.998,16.063c-52.896,0-135.503-40.997-167.805,8c-2.154,0-4.289,0-8.195,0
                      c-30.928,0-56,25.356-56,56.284c0,28.716,8,71.725,8,71.725s9-40.5,48-56c0.011-0.004,0.022-0.01,0.033-0.015l-0.033,0.299
                      c78.667,42.667,152,15.716,152,15.716l24,40C373.498,106.572,367.998,27.563,359.998,16.063z"
            />
          </g>
        </svg>
      </Tooltip>
    </div>
  );
};

Player.defaultProps = {
  primaryColor: '#FF6955',
  secondaryColor: '#FFBE37',
  accentColor: '#C85050'
};

export default Player;
