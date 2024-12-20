
document.addEventListener('DOMContentLoaded', () => {
    axios.get('http://52.79.220.59:8090/admin/selectHospListAll')
        .then(response => {
            const hospitals = response.data;
            let html = '';

            hospitals.forEach(hospital => {
                html += `
                    <tr>
                        <td>${hospital.hospitalName}</td>
                        <td>${hospital.address}</td>
                        <td>${hospital.phone}</td>
                        <td>${hospital.establishedDate}</td>
                        <td>${hospital.status}</td>
                    </tr>
                `;
            });

            document.getElementById('hospitalList').innerHTML = html;
        })
        .catch(error => {
            console.error('Error:', error);
        });
});
