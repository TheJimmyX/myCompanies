//------------- My Model ---------------//
class Company {

    
    constructor(){
        this.url = "http://localhost:3000/api/"        
    }

    async getCompanies(page_number, per_page, search = null){        
        let endpoint = `${this.url}companies?page=${page_number}&per_page=${per_page}&search=${search}`

        try {
            let res = await fetch(endpoint)
            let metadata = {
                page_items:     res.headers.get('Page-Items'),
                current_page:   res.headers.get('Current-Page'),
                total_pages:    res.headers.get('Total-Pages'),
                total_items:    res.headers.get('Total-Count'),
            }
            let data = {
                data: await res.json(),
                metadata: metadata
            }
            
            return data
        } catch (error) {
            console.log(error)
        }
    }

    async getCompany(id){
        let endpoint = `${this.url}companies/${id}`

        try {
            let res = await fetch(endpoint)            
            return await res.json()
        } catch (error) {
            console.log(error)
        }        
    }
}

export default Company
