const getDay1Results = input => {
  const data = input.split('\n\n').map(item => item.split('\n'));

  const getCaloriesAsNumber = input =>
    input.reduce((acc, curr) => Number(acc) + Number(curr), 0);

  const totalCalories = data.map(item => getCaloriesAsNumber(item));

  const sorted = totalCalories.sort((a, b) => a - b);

  const totalElves = sorted.length - 1;

  const firstAnswer = sorted[totalElves];

  const secondAnswer =
    sorted[totalElves] + sorted[totalElves - 1] + sorted[totalElves - 2];

  return {firstAnswer, secondAnswer};
};
