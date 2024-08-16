const items = {tomato:2, potato:1, eggs:4};

const doublePriceItems = Object.fromEntries(Object.entries(items).map(([item, price])=>{
    return [item,2*price];
}));

console.log(doublePriceItems);