import {Controller} from "@hotwired/stimulus";
import {Chart, registerables} from "chart.js";

Chart.register(...registerables)

export default class extends Controller {

    connect() {
        const canvas = this.element;
        const chartData = JSON.parse(canvas.dataset.adminData)

        this.chart = new Chart(canvas, {
            type: 'bar',
            data: chartData,
            options: {
                responsive: true,
                scales: {
                    x: {
                        grid: {
                            display: false // Remove vertical gridlines
                        }
                    },
                    y: {
                        grid: {
                            display: false // Remove horizontal gridlines
                        }
                    }
                }
            },

        });

        canvas.addEventListener('click', this.handleClick.bind(this));
    }

    handleClick(event) {
        // Get the clicked point on the chart
        const activePoint = this.chart.getElementsAtEvent(event);

        // Check if a point was clicked
        if (activePoint && activePoint.length > 0) {
            const datasetIndex = activePoint[0].datasetIndex;
            const dataIndex = activePoint[0].index;

            // Get the data point that was clicked
            const label = this.chart.data.labels[dataIndex];
            const value = this.chart.data.datasets[datasetIndex].data[dataIndex];

            // Perform any desired action with the clicked data
            console.log(`Clicked: ${label} - ${value}`);
        }
    }

    disconnect() {
        this.chart.destroy();
    }
};
