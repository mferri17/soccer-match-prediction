import createStore from 'react-waterfall';
import { getURL } from './utils';

const LOCAL_STORAGE_KEY = 'configs';

const config = {
  initialState: {
    results: null,
    availablePlayers: [],
    configs: JSON.parse(localStorage.getItem(LOCAL_STORAGE_KEY) || '[]'),
    teams: [{
      players: []
    }, {
      players: []
    }]
  },
  actionsCreators: {
    init: async (state) => {
      const playersResponse = await fetch(getURL('players'))

      return {
        ...state,
        availablePlayers: await playersResponse.json()
      };
    },
    addPlayer: (state, _, {
      player,
      team: teamToUpdate
    }) => ({
      ...state,
      teams: state.teams.map(team => {
        if (team === teamToUpdate) {
          return {
            ...teamToUpdate,
            players: [
              ...team.players,
              {
                x: 6,
                y: 6,
                ...player
              }
            ]
          };
        }

        return team;
      })
    }),
    removePlayer: (state, _, {
      player,
      team: teamToUpdate
    }) => ({
      ...state,
      teams: state.teams.map(team => {
        if (team === teamToUpdate) {
          return {
            ...teamToUpdate,
            players: team.players.filter(p => p !== player)
          };
        }

        return team;
      })
    }),
    updatePlayer: (state, _, {
      team: teamToUpdate,
      oldPlayer,
      newPlayer
    }) => ({
      ...state,
      teams: state.teams.map(team => {
        if (team === teamToUpdate) {
          return {
            ...teamToUpdate,
            players: team.players.map(player => {
              if (player === oldPlayer) return newPlayer;

              return player;
            })
          };
        }

        return team;
      })
    }),
    computeResults: async state => {
      const response = await fetch(getURL('predict'), {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(state.teams)
      });
      const results = await response.json();

      return {
        ...state,
        results
      };
    },
    resetResults: state => ({
      ...state,
      results: null
    }),
    deleteConfig: (state, _, config) => {
      const newConfigs = state.configs.filter(x => x !== config);

      localStorage.setItem(LOCAL_STORAGE_KEY, JSON.stringify(newConfigs));

      return {
        ...state,
        configs: newConfigs
      };
    },
    load: (state, _, config) => ({
      ...state,
      teams: config.teams
    }),
    save: (state, _, config) => {
      const newConfigs = [
        ...state.configs.filter(x => x.id === config.id),
        config
      ];

      localStorage.setItem(LOCAL_STORAGE_KEY, JSON.stringify(newConfigs));

      return {
        ...state,
        configs: newConfigs
      };
    }
  },
}

export const { Provider, connect, actions } = createStore(config)