import Sortable from "sortablejs"

const list = document.querySelector("ol")
console.log("Hello from sortable")

const initSortable = () => {
  Sortable.create(list, {
    ghostClass: "ghost",
    animation: 150,
    // onEnd: (event) => {
    //   alert(`${event.oldIndex} moved to ${event.newIndex}`)
    // }
  })
}

initSortable()
