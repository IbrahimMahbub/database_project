async function fetchData() {
    const location = document.getElementById("locationSelect").value;
    const response = await fetch(`/getData?location=${location}`);
    const data = await response.json();
    displayData(data);
}

function displayData(data) {
    let outputDiv = document.getElementById("output");
    outputDiv.innerHTML = '';

    for (let tableName in data) {
        let tableData = data[tableName];
        let tableHtml = `
            <h3>${tableName}</h3>
            <table>
                <thead>
                    <tr>
                        ${Object.keys(tableData[0]).map(col => `<th>${col}</th>`).join('')}
                    </tr>
                </thead>
                <tbody>
                    ${tableData.map(row => `
                        <tr>
                            ${Object.values(row).map(value => `<td>${value}</td>`).join('')}
                        </tr>
                    `).join('')}
                </tbody>
            </table>
        `;
        outputDiv.innerHTML += tableHtml;
    }
}