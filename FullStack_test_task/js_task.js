const fileUrl = "https://www.geoprostor.net/data/opsi/trzic?format=json";
function getSum(list){
  sum = 0;
  let length = list.length;
  for (i = 0; i < length; i++) {
    sum += list[i].Cena;
  }
  return sum;
}

function filterData(list){
  res = [];
  let length = list["Items"].length;
  const operativng = list["Items"];
  j = 0;
  for (i = 0; i < length; i++) {
    if (operativng[i]["Kraj"] == "KOVOR"){
      res[j] = operativng[i];
      j++;
    }
  }
  return res;
}

fetch(fileUrl)
  .then(response => {
    if (!response.ok) {
      throw new Error('Nekaj ni ok s povezavo.');
    }
    return response.json();
  })
  .then(data => {
    const filteredData = filterData(data);
    const sumCena = getSum(filteredData);
    const sumVelikost = filteredData.reduce((sum, element) => {
      const numbers = element.Velikost.split(' ').filter(str => !isNaN(parseFloat(str)));
      return sum + numbers.reduce((innerSum, numStr) => innerSum + parseFloat(numStr), 0);
    }, 0);

    console.log(`Povprečna vrednost kvadratnega metra v kraju Kovor je ${(sumCena / sumVelikost).toFixed(2)} €.`);
  })
  .catch(error => {
    console.error('Težava pri fetchanju:', error);
  });
