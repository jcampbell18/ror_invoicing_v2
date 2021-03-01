# Backend: Invoicing System

## Environment

### Operating System

- [x] Ubuntu 20.10
  
### IDE

- [x] Rubymine 2020.3

#### Rubymine Setup

- [x] Type: Rails API
  
- [x] Rails Version: 6.0.3.5
  
- [x] Ruby Version: 2.7.2
  
- [x] Database: Postgres
  
- [x] Project Name: ror_invoicing_v2

- generated-command: `rails _6.0.3.5_ new /home/jcryuu/ror_projects/ror_invoicing_v2 --api --skip --database=postgresql`

- ![image](https://raw.githubusercontent.com/jcampbell18/ror_invoicing_v2/master/Screenshot%20from%202021-02-28%2018-53-12.png)

##### Database

- click on Views > Tool Windows > Database

- click on the '+' for new
    - Data Source > PostgreSQL
      
        - update name field
            - `PostgreSQL`
            
        - update username and password fields
          
        - update database name
            - `ror_invoicing_v2_development`
        - update database name url (at end to match name above)
            - `jdbc:postgresql://localhost:5432/ror_invoicing_v2_development`
          
        - test connection

- ![image](https://raw.githubusercontent.com/jcampbell18/ror_invoicing_v2/master/Screenshot%20from%202021-02-28%2019-04-33.png)

## Build Database/Model

### Scaffold

- creates controller, model, view, and updates routes

#### Tables without foreign keys

##### Terminal Commands

- `rails g scaffold State name:string{75} abbreviation:string{4}`

- `rails g scaffold BidStatus name:string{20}`

- `rails g scaffold AccessLevel name:string{50} description:string{250}`

- `rails g scaffold CompanyCategory name:string{50}`

- `rails g scaffold ExpenseCategory name:string{50} description:string{250}`

- `rails g scaffold Vehicle man_year:date make:string{50} model:string{50} sub_model:string{50} engine:string{50} notes:string{150}`

- `rails g scaffold Sku name:string{50} description:string{250}`

- `rails g scaffold Term name:string{150}`

- `rails g scaffold ImageType name:string{50}`

- `rails g scaffold Image image_type:references filename:string{250} title:string{75} file_path:text`

- `rails db:migrate`

#### Tables with foreign keys

##### Terminal Commands

- `rails g scaffold ProjectSite address:string{100} city:string{50} state:references zipcode:string{6} access_code:string{10} map_link:text`

- `rails g scaffold Company company_category:references business_name:string{75} contact_name:string{75} address:string{75} city:string{50} state:references zipcode:string{6} phone:string{14} phone_ext:string{6} fax:string{14} email:string{50} website:string{50} image:references`

- `rails g scaffold Bid company:references project_site:references sku:references bid_status:references bid_date:datetime description:text amount:decimal{'6,2'}`

- `rails g scaffold User username:string{50} password:string{250} access_level:references company:references name:string{50} phone:string{14} phone_ext:string{6} email:string{100}`

- `rails g scaffold Mileage project_site:references vehicle:references invoice:references drive_date:date start_mileage:decimal{'7,1'} end_mileage:decimal{'7,1'} subtotal:decimal{'7,1'} notes:string{150}`

- `rails g scaffold Invoice company:references project_site:references sku:references bid:references term:references start_date:date end_date:date description:text amount:decimal{'8,2'} receipts:integer{1} images:integer{1} image:references mileage:references loan_amount:decimal{'8,2'} loan_paid:integer{1} interest_amount:decimal{'8,2'} interest_paid:integer{1} complete:integer{1} paid:integer{1} paid_checknum:string{50} paid_date:date project_cost:decimal{'8,2'} save_tax:decimal{'8,2'} actual_net:decimal{'8,2'}`

- `rails g scaffold Expense invoice:references company:references expense_category:references vehicle:references pdate:date name:string{250} quantity:integer{4} amount:decimal{'8,2'} subtotal:decimal{'8,2'} tax_include:integer{1} tax:decimal{'8,5'} total:decimal{'8,2'} receipt_reference:string{100} image:references`

- `rails db:migrate`

### Update Controller and Namespace

- create folder app/controllers/`api`
  
- create folder app/controllers/api/`v2`
  
- move all controller files to app/controllers/api/v2/ EXCEPT application_controller

- ![image](https://raw.githubusercontent.com/jcampbell18/ror_invoicing_v2/master/Screenshot%20from%202021-02-28%2018-56-26.png)

- edit the files in app/controllers/api/v2
  
    - add `Api::V2::` to head of file:
      
        - class Api::V2::SomeController < ApplicationController

- ![image](https://raw.githubusercontent.com/jcampbell18/ror_invoicing_v2/master/Screenshot%20from%202021-02-28%2019-02-59.png)

### Update Routes with Namespaces

- above the first resources line, add:
    
    - `namespace :api do`
      
    - `  namespace :v2 do`
    
- after the last resources line, add:

    - `  end`
    
    - `end`
    
- ![image](https://raw.githubusercontent.com/jcampbell18/ror_invoicing_v2/master/Screenshot%20from%202021-02-28%2018-54-10.png)
