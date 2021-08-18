//------------- My Model ---------------//
export class Company {

    async getCompanies(){
        let url = 'http://localhost:3000/api/companies'
        try {
            let res = await fetch(url)
            let metadata = {
                page_items: res.headers.get('Page-Items'),
                current_page: res.headers.get('Current-Page'),
                total_pages: res.headers.get('Total-Pages'),
                total_items: res.headers.get('Total-Count'),
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
}
