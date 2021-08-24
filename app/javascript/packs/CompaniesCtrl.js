import Company from "./Company"

class CompaniesCtrl {

    constructor(){
        this.CompanyModel   = new Company()
        this.element        = ''
        this.total_pages    = 0
        this.per_page       = 20
        this.current_page   = 1
        this.total_items    = 0
        this.searchForm     = ''
        this.searchValue    = null
        this.pathname       = window.location.pathname
        this.company        = {}
        

    }

    async getCompanies(){        
        const response      = await this.CompanyModel.getCompanies(this.current_page, this.per_page, this.searchValue)
        
        const companies     = response.data        
        this.total_pages    = parseInt(response.metadata.total_pages)
        this.per_page       = parseInt(response.metadata.page_items)
        this.current_page   = parseInt(response.metadata.current_page)
        this.total_items    = parseInt(response.metadata.total_items)


        const component = document.querySelector('#companies_index_table tbody')
        component.innerHTML = ''
        let row = ''

        companies.forEach(company => {
            let cell = ''
            
            Object.entries(company).forEach(prop => {
                if(prop[0] == "name"){
                    cell += `<td><a href="companies/${company.id}">${prop[1]}</a></td>`
                }else{
                    cell += `<td>${prop[1]}</td>`
                }
            })

            row += `<tr>${cell}</tr>`
        })

        component.innerHTML = row        
        this.drawButtons()
    }

    async getCompany(id){
        this.company = await this.CompanyModel.getCompany(id)

        Object.entries(this.company).forEach(prop => {
            if(prop[0] != "id"){
                document.querySelector(`#company_${prop[0]}`).value = prop[1]
            }
        })        
    }

    drawButtons(){
        this.element.innerHTML = ''

        let buttons = `<li class="page-item ${this.current_page === 1 ? "disabled" : ""}"><a class="page-link" data-page="${this.current_page - 1}">Anterior</a></li>`

        for(let i = 1; i <= this.total_pages; i++){            
            buttons += `<li class="page-item ${this.total_pages === 1 ? "disabled" : (i === this.current_page ? "active" : "")}"><a class="page-link" data-page="${i}">${i}</a></li>`
        }

        buttons += `<li class="page-item ${this.current_page === this.total_pages ? "disabled" : ""}"><a class="page-link" data-page="${this.current_page + 1}">Siguiente</a></li>`
        
        this.element.innerHTML = buttons
    }

    changePage(target){            
        if(target.getAttribute('data-page') !== null){
            const page = target.getAttribute('data-page')
            this.current_page = page            
            this.getCompanies()
        }
    }

    search(value){
        this.searchValue = value
        this.current_page = 1
        this.getCompanies()
    }

    init(){
        
        if(this.pathname == "/"){
            this.element        = document.querySelector('#pagination')
            this.searchForm     = document.querySelector('#searchForm')

            this.element.addEventListener('click', e => {
                this.changePage(e.target)
            })
    
            this.searchForm.addEventListener('submit', event => {
                event.preventDefault()            
                this.search(document.querySelector('#search').value)
            })
            this.getCompanies()
        }

        if(this.pathname.match(/\bcompanies\/[0-9]/i)){
            const companyId = this.pathname.split("/")[2]
            this.getCompany(companyId)

            const element = document.querySelector("#edit_company_form")

            element.addEventListener('submit', event => {
                event.preventDefault()
            })
        }
        
    }
}

const companiesCtrl = new CompaniesCtrl()
companiesCtrl.init()