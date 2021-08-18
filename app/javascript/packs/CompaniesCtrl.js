import { Company } from "./Company";

class CompaniesCtrl {
    myCompany

    constructor(){
        this.myCompany = new Company()    
    }

    async getCompanies(){
        let response    = await this.myCompany.getCompanies()
        let companies   = response.data
        let metadata    = response.metadata

        const $companiesListUI = document.getElementById('companies_index_table')
        let tbody = $companiesListUI.createTBody(); 

        companies.forEach(company => {
            let row = tbody.insertRow()
            let values = Object.values(company)

            values.forEach(value => {
                let td = document.createElement("td")
                let txt = document.createTextNode(value)
                td.appendChild(txt)
                row.appendChild(td)
            })

            let ltd = document.createElement("td")
            ltd.appendChild(this.addBtn("Edit", ["btn-success"]))
            ltd.appendChild(this.addBtn("Delete", ["btn-danger"]))
            row.appendChild(ltd)
        })     
    }

    addBtn(value, classesName){
        let btn = document.createElement("BUTTON")
        btn.innerHTML = value
        btn.className = "btn"
        btn.classList.add(classesName)
        return btn
    }

    init(){
        this.getCompanies()
    }
}

const myCompaniesCTRL = new CompaniesCtrl();
myCompaniesCTRL.init()