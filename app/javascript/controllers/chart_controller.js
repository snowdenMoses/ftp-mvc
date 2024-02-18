import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";

Chart.register(...registerables)

export default class extends Controller {
  static values = {favourites: Array}
  initialize() {
    console.log(this.favouritesValue)
    console.log("Hello from vendor analytics")
    const ctx = document.getElementById('myChart')
    new Chart(ctx, {
      type: "bar",
      data: {
        labels: this.favouritesValue.map(fav=> fav.name),
        datasets: [{
          label: "# of Likes",
          data: this.favouritesValue.map(fav=> fav.product_count),
          backgroundColor: [
            "rgba(255, 99, 132, 0.2)",
            "rgba(54, 162, 235, 0.2)",
            "rgba(255, 206, 86, 0.2)",
            "rgba(75, 192, 192, 0.2)",
            "rgba(153, 102, 255, 0.2)",
            "rgba(255, 159, 64, 0.2)"
          ],
          borderColor: [
            "rgba(255, 99, 132, 1)",
            "rgba(54, 162, 235, 1)",
            "rgba(255, 206, 86, 1)",
            "rgba(75, 192, 192, 1)",
            "rgba(153, 102, 255, 1)",
            "rgba(255, 159, 64, 1)"
          ],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }
}
