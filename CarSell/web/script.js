document.addEventListener("DOMContentLoaded", function () {
    loadAllCars(); // Load danh sách xe khi mở trang
});

// Gọi API lấy tất cả xe
function loadAllCars() {
    fetch("/getAllCars")
            .then(response => response.json())
            .then(data => {
                displayCars(data);
            })
            .catch(error => console.error("Lỗi khi tải xe:", error));
}

// Gọi API tìm kiếm xe theo tên
function searchCar() {
    let name = document.getElementById("searchInput").value;
    fetch(`/searchCar?name=${encodeURIComponent(name)}`)
            .then(response => response.json())
            .then(data => {
                displayCars(data);
            })
            .catch(error => console.error("Lỗi khi tìm kiếm:", error));
}

// Hiển thị danh sách xe lên bảng HTML
function displayCars(cars) {
    let tbody = document.getElementById("carTableBody");
    tbody.innerHTML = "";
    cars.forEach(car => {
        let row = `<tr>
            <td>${car.id}</td>
            <td>${car.name}</td>
            <td>${car.price}</td>
            <td>${car.max_speed}</td>
            <td>${car.acceleration}</td>
        </tr>`;
        tbody.innerHTML += row;
    });
}
