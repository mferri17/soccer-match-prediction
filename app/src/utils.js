export const range = n => [...new Array(n).keys()];

export const getTeamName = teamInfo => `${teamInfo.team_long_name} (${teamInfo.team_short_name})`;

const isValidTeam = team =>
  team &&
  team.teamInfo && team.teamInfo.id &&
  team.players.length === 11 &&
  team.players.filter(player => player.x === 1 && player.y === 1).length === 1; // exactly one goalkeeper

export const isMatchValid = teams => teams.every(team => isValidTeam(team));

export const canMovePlayer = (x, y, team) =>
  x !== 0 && y !== 0 && x < 13 && y < 13 && // can move if it is not outside of the lines
  !(y === 1 && team.players.find(({ x: px, y: py }) => px === 1 && py === 1)); // cannot place more than 1 goalkeeper
