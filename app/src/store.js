import createStore from 'react-waterfall';

const LOCAL_STORAGE_KEY = 'configs';
const BASE_URL = 'http://localhost:1234/';
const getURL = url => `${BASE_URL}${url}`;

const config = {
  initialState: {
    results: null,
    availableTeams: [],
    availablePlayers: [],
    configs: JSON.parse(localStorage.getItem(LOCAL_STORAGE_KEY) || '[]'),
    teams: [{
      teamInfo: {},
      players: []
    }, {
      teamInfo: {},
      players: []
    }]
  },
  actionsCreators: {
    init: async (state) => {
      const [teamsResponse, playersResponse] = await Promise.all([
        fetch(getURL('teams')),
        fetch(getURL('players'))
      ]);

      return {
        ...state,
        availableTeams: await teamsResponse.json(),
        availablePlayers: await playersResponse.json()
      };
    },
    changeTeam: (state, _, teamToUpdate, teamId) => ({
      ...state,
      teams: state.teams.map(team => {
        if (team === teamToUpdate) {
          return {
            ...teamToUpdate,
            teamInfo: {
              ...state.availableTeams.find(team => team.id === teamId)
            }
          };
        }

        return team;
      })
    }),
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
      const response = await fetch(getURL('predict'));
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