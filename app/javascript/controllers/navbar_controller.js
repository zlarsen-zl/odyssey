// import { Collapse } from "flowbite";

// set the target element that will be collapsed or expanded (eg. navbar menu)
// const $targetEl = document.getElementById('targetEl');
// // optionally set a trigger element (eg. a button, hamburger icon)
// const $triggerEl = document.getElementById('triggerEl');
//
// // optional options with default values and callback functions
// const options = {
//     onCollapse: () => {
//         console.log('element has been collapsed')
//     },
//     onExpand: () => {
//         console.log('element has been expanded')
//     },
//     onToggle: () => {
//         console.log('element has been toggled')
//     }
// };
//
// const collapse = new Collapse($targetEl, $triggerEl, options);

// hide the target element
// $targetEl.addEventListener('turbo:load', () =>{
//     collapse.collapse();
// });

// document.addEventListener('turbo:load', () => {
//     collapse.collapse();
// });

// collapse.collapse();

// show the target element

// $targetEl.addEventListener('turbo:load', () =>{
//     collapse.expand();
// });

// document.addEventListener('turbo:load', () => {
//     collapse.expand();
// });
// collapse.expand();

// toggle the visibility of the target element
// $targetEl.addEventListener('turbo:load', () =>{
//     collapse.toggle();
// });

// document.addEventListener('turbo:load', () => {
//     collapse.toggle();
// });
// collapse.toggle();


import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values  = { state: Boolean }
    static targets = [ "menu", "x", "bars" ]

    connect() {
        console.log(this.stateValue)
    }

    toggle() {
        this.stateValue = !this.stateValue

        if (this.stateValue) {
            this.openMenu()
            this.showX()
        } else {
            this.closeMenu()
            this.showBars()
        }
    }

    openMenu() {
        this.menuTarget.classList.remove("hidden");
        console.log('element has been opened')
    }

    closeMenu() {
        this.menuTarget.classList.add("hidden");
        console.log('element has been closed')
    }

    showBars() {
        this.xTarget.classList.add("hidden")
        this.barsTarget.classList.remove("hidden")
    }

    showX() {
        this.xTarget.classList.remove("hidden")
        this.barsTarget.classList.add("hidden")
    }
};

