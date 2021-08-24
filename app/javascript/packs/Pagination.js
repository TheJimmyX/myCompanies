class Pagination{

    total_pages  
    per_page     
    current_page 
    total_items  

    constructor(element){        
        this.element = document.querySelector(element)        
    }

    drawButtons(){
        this.element.innerHTML = ''

        let buttons = `<li class="page-item ${this.current_page === 1 ? "disabled" : null}"><a class="page-link" data-page="${this.current_page - 1}">Anterior</a></li>`

        for(let i = 1; i <= this.total_pages; i++){            
            buttons += `<li class="page-item ${i === this.current_page ? "active" : null}"><a class="page-link" data-page="${i}">${i}</a></li>`
        }

        buttons += `<li class="page-item ${this.current_page === this.total_pages ? "disabled" : null}"><a class="page-link" data-page="${this.current_page + 1}">Siguiente</a></li>`
        
        this.element.innerHTML = buttons

        this.element.addEventListener('click', e => {            
            return e.target.getAttribute('data-page')
        })
    }

    setMetadata({total_pages = 0, per_page = 0, current_page = 0, total_items = 0}){
        this.total_pages    = parseInt(total_pages)
        this.per_page       = parseInt(per_page)
        this.current_page   = parseInt(current_page)
        this.total_items    = parseInt(total_items)
    }

    init(){
        this.drawButtons()
    }
}

export default Pagination