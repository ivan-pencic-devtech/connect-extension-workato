#
# This file is a part of the Ingram Micro’s CloudBlue Connect Workato Extension.

#

# @copyright (c) 2021. Ingram Micro. All Rights Reserved.

#


{
  title: "CloudBlue Connect",

  # API key authentication example. See more examples at https://docs.workato.com/developing-connectors/sdk/guides/authentication.html
  connection: {
    fields: [
      {
        name: "api_token",
        label: "API Token",
        hint: "You can find your API Token in <a href='https://portal.connect.cloudblue.com/integrations/tokens/' target='_blank'>Connect</a>",
        optional: false
      },
    ],

    authorization: {
      type: "custom_auth",

      # Calendly uses header auth (Authorization: <api key>)
      apply: lambda do |connection|
        headers("Authorization": connection["api_token"])
      end
    },

    base_uri: lambda do
      "https://api.connect.cloudblue.com"
    end
  },

  test: lambda do |_connection|
    get("/public/v1")
  end,

  object_definitions: {
  
    cancel_request: {
      fields: lambda do
        [
          { name: "id"},
          { name: "type"},
          { name: "error_code"},
          { name: "status" },
          { name: "params_form_url"},
          { name: "asset", type: "object", properties: [
            { name: "id" },   
            { name: "external_id" }
          ]},
          { name: "errors", type: "array"},
        ]
      end
  
    },    
    purchase_request: {
      fields: lambda do
        [
          { name: "id"},
          { name: "type"},
          { name: "status" },
          { name: "params_form_url"},
          { name: "asset", type: "object", properties: [
            { name: "id" },   
            { name: "external_id" }
          ]}
        ]
      end
  
    },
    change_request: {
      fields: lambda do
        [
          { name: "id"},
          { name: "type"},
          { name: "error_code"},
          { name: "status"},
          { name: "asset", type: "object", properties: [
            { name: "id"},
            { name: "external_id"},
            { name: "external_uid"}
            ]
          },
          { name: "errors", type: "array"},
          
          
         ]
      end
    },
    request: {
      fields: lambda do
        [
          { name: "id"},
          { name: "type"},
          { name: "note"},
          { name: "reason"},
          { name: "created"},
          { name: "updated"},
          { name: "answered""note"},
          { name: "reason"},
          { name: "assignee"},
          { name: "activation_key"},
          { name: "status" },
          { name: "asset", type: "object", properties: [
            { name: "id" },
            { name: "status" },
            { name: "external_id" },
            { name: "external_uid" },
            { name: "product", type: "object", properties: [
              { name: "id" },
              { name: "icon" },
              { name: "name" },
              { name: "status" }
            ]},
            # skipped connection and events structures
            { name: "items", type: "array", properties: [
              { name: "id" },
              { name: "global_id" },
              { name: "mpn" },
              { name: "old_quantity" },
              { name: "quantity" },
              { name: "type" },
              { name: "display_name" },
              { name: "period" },
              { name: "item_type" }
            ]},
            # skipped params array, tiers and configuration structures
            { name: "marketplace", type: "object", properties: [
              { name: "id" },
              { name: "name" },
              { name: "icon" }
            ]}
            # skipped contract structure
          ]}
        ]
      end
    },
  },
  methodes: {
  },
  actions: {


    asset_cancel_request: {
      title: "Create Asset Cancel Request",
      subtitle: "",
      description: "",
      help: "<a href='https://connect.cloudblue.com/community/api/openapi/#operations-Assets-request_list_listRequests' target='_blank'>Official documentation</a>",
      
       input_fields: lambda do |object_definitions|
        [
          {
            name: "external_id",
            label: "External ID",
            hint: "Provide the External ID of the Asset that you want to cancel.",
            optional: false
          },
          {
            name: "external_uid",
            label: "External UID",
            hint: "Provide the External UID of the Asset that you want to cancel.",
            optional: false
          },
          
        ]
      end,
      
      execute: lambda do |connection, input|
        
        params = {
          "type": "cancel",
          "asset": {
            "external_id": "#{input["external_id"]}",
            "external_uid": "#{input["external_uid"]}"
          }
        }
   
        post("https://api.connect.cloudblue.com/public/v1/requests", params).
          after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,
      
      output_fields: lambda do |object_definitions|
        object_definitions["cancel_request"]
      end
    },
    
    asset_purchase_request: {
      title: "Create Asset Purchase Request",
      subtitle: "",
      description: "",
      help: "<a href='https://connect.cloudblue.com/community/api/openapi/#operations-Assets-request_list_listRequests' target='_blank'>Official documentation</a>",
      
       input_fields: lambda do |object_definitions|
        [
          {
            name: "external_id",
            label: "Asset External ID",
            hint: "Provide the ID of the asset from the external system, for example pointing to a contract identifier or unique one that will map this asset with.",
            optional: true
          },
          {
            name: "external_uid",
            label: "Asset External UID1",
            hint: "Provide if you have it a unique identifier in the form of a UUID for the requested asset on the commerce system, in case it's not provided a unique UUID will be auto-generated.
",
            optional: false
          },
          
                    {
            name: "hub_id",
            label: "Hub ID",
            hint: "Provide the ID of your hub obtained from Provider Portal Hubs module. ID of the hub must have the form of HB-XXXX-XXXX.
",
            optional: false
          },
          
          
           {
            name: "tier1_external_id",
            label: "Tier 1 External ID",
            hint: "Provide the ID of the Tier 1 on the external system that will help you identify the account on Connect platform. Please note that vendor also will see it for helping on support operations.
",
            optional: true
          },
          {
            name: "tier1_external_uid",
            label: "Tier 1 External UID",
            hint: "Provide if you have it a unique identifier in the form of a UUID for the tier on the commerce system, in case it's not provided a unique UUID will be auto-generated.
",
            optional: true
          },
                     {
            name: "tier1_account_name",
            label: "Tier 1 Account Name",
            hint: "Specify the company or account name on the commerce system to be used for request creation.

",
            optional: false
          },
          {
            name: "tier1_address_line1",
            label: "Tier 1 Address Line 1",
            hint: "Provide the postal address of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.

",
            optional: false
          },
                    {
            name: "tier1_address_line2",
            label: "Tier 1 Address Line 2",
            hint: "",
            optional: true
          },
          {
            name: "tier1_postal_code",
            label: "Tier 1 Postal Code",
            hint: "Provide the postal code of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.


",
            optional: false
          },
                    {
            name: "tier1_city",
            label: "Tier 1 City",
            hint: "Please specify the City name of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.



",
            optional: false
          },
          {
            name: "tier1_state",
            label: "Tier 1 State Or Province",
            hint: "",
            optional: false
          },
          
          {
            name: "tier1_country",
            label: "Tier 1 Country",
            hint: "Provide the country of the related account, please use Alpha-2 code.",
            optional: false
          },
         {
            name: "tier1_first_name",
            label: "Tier 1 Contact First Name",
            hint: "Provide the contact name of the technical contact related with the account.",
            optional: false
          },
          {
            name: "tier1_last_name",
            label: "Tier 1 Contact Last Name",
            hint: "Provide the last name or family name of the technical contact related with the account.",
            optional: false
          },
          {
            name: "tier1_email",
            label: "Tier 1 Email",
            hint: "Provide the email address of the technical contact related with the account, this one typically is a requirement by vendors to process the request, additionally please note that this email will be used to send inquire requests related with the fulfillment of the request.
",
            optional: false
          },
         {
            name: "tier1_phone_number",
            label: "Tier 1 Phone Number",
            hint: "Provide the phone number of the technical contact. We suggest to use international phone notation in order to ensure the correctness of the phone number.
",
            optional: true
          },
          {
            name: "customer_external_id",
            label: "Customer External ID",
            hint: "Provide the ID of the Customer on the external system that will help you identify the account on Connect platform. Please note that vendor also will see it for helping on support operations.",
            optional: true
          },
        {
            name: "customer_external_uid",
            label: "Customer External UID",
            hint: "Provide if you have it a unique identifier in the form of a UUID for the tier on the commerce system, in case it's not provided a unique UUID will be auto-generated.",
            optional: false
          },
                    {
            name: "customer_account_name",
            label: "Customer Account Name",
            hint: "Specify the company or account name on the commerce system to be used for request creation.
",
            optional: false
          },
                    {
            name: "customer_address_line1",
            label: "Customer Address Line 1",
            hint: "Provide the postal address of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.

",
            optional: false
          },
                    {
            name: "customer_address_line2",
            label: "Customer Address Line 2",
            hint: "Specify the company or account name on the commerce system to be used for request creation.
",
            optional: true
          },
          
                          {
            name: "customer_postal_code",
            label: "Customer Postal Code",
            hint: "Provide the postal code of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.",
            optional: false
          },
                          {
            name: "customer_city",
            label: "Customer City",
            hint: "Please specify the City name of the related account, please note that are not validated by CloudBlue Connect but vendor may do it.",
            optional: false
          },
          
           {
            name: "customer_state",
            label: "Customer State Or Province",
            hint: "",
            optional: false
          },
          
              {
            name: "customer_country",
            label: "Customer Country",
            hint: "Provide the country of the related account, please use Alpha-2 code.",
            optional: false
          },
          
              {
            name: "customer_contact_first_name",
            label: "Customer Contact First Name",
            hint: "Provide the contact name of the technical contact related with the account.",
            optional: false
          },
          
              {
            name: "customer_contact_last_name",
            label: "Customer Contact Last Name",
            hint: "Provide the last name or family name of the technical contact related with the account.",
            optional: false
          },
          
                {
            name: "customer_email",
            label: "Customer Email",
            hint: "Provide the email address of the technical contact related with the account, this one typically is a requirement by vendors to process the request, additionally please note that this email will be used to send inquire requests related with the fulfillment of the request.
",
            optional: false
          },
          
                {
            name: "customer_phone_number",
            label: "Customer Phone Number",
            hint: "Provide the phone number of the technical contact. We suggest to use international phone notation in order to ensure the correctness of the phone number.

",
            optional: true
          },
          
          
                {
            name: "product_id",
            label: "Product ID",
            hint: "Provide the Product's ID.

            ",
            optional: false
          },
          
          {
            name: "product_items",
            label: "Product Items",
            hint: "",
            optional: false,
            type: "array", of: "object", properties: [
            { optional: false, name: "id", label: "Item ID" },
            { optional: false, name: "quantity", label: "Quantity" }
            ]
          },
          
          
        ]
      end,
      
      execute: lambda do |connection, input|
        
        x = 4
        rand_uid_num = (rand(10 ** x) + 10**x).to_s[0..x-1]
        rand_uid_num_two = (rand(10 ** x) + 10**x).to_s[0..x-1]
        rand_id_num = (rand(10 ** x) + 10**x).to_s[0..x-1]
        first_item = input["product_items"][0]
        #"id"=>"#{first_item["id"].slice(0, first_item["id"].rindex("-"))}"
        hardcoded_params = {
           "type"=>"purchase",
           "asset"=>{
           "product"=>{
           "id"=>"#{input["product_id"]}"
             
      },
      "connection"=>{
         "id"=>"CT-0000-0000-0000",
         "type"=>"production"
      },
      "external_uid"=>"#{rand_uid_num}24b9-627e-#{rand_uid_num_two}-bad2-f3401795504a",
      "external_id"=>"#{input["external_id"]}",
      "items"=> input["product_items"],
      "params"=>[],
      "tiers"=>{
         "customer"=>{
            "name"=>"#{input["customer_account_name"]}",  
            "type"=>"customer",        
            "external_id"=>"#{input["customer_external_id"]}",  
            "external_uid"=>"#{input["customer_external_uid"]}",  
        
            "contact_info"=>{
               "address_line1"=>"#{input["customer_address_line1"]}",    
               "address_line2"=>"#{input["customer_address_line2"]}",
               "city"=>"#{input["customer_city"]}",
               "state"=>"#{input["customer_state"]}",
               "postal_code"=>"#{input["customer_postal_code"]}",
               "country"=>"#{input["customer_country"]}",
               "contact"=>{
                  "first_name"=>"#{input["customer_contact_first_name"]}",     
                  "last_name"=>"#{input["customer_contact_last_name"]}",    
                  "email"=>"#{input["customer_email"]}",    
                  "phone_number"=>{
                     "country_code"=>"",
                     "area_code"=>"",
                     "phone_number"=>"",
                     "extension"=>""
                  }
               }
            }
         },
         "tier1"=>{
            "name"=>"#{input["tier1_account_name"]}", 
            "type"=>"reseller",
            "external_uid"=>"3444",  

          "contact_info"=>{
               "address_line1"=>"#{input["tier1_address_line1"]}",    
               "address_line2"=>"#{input["tier1_address_line2"]}",
               "city"=>"#{input["tier1_city"]}",
               "state"=>"#{input["tier1_state"]}",
               "postal_code"=>"#{input["tier1_postal_code"]}",
               "country"=>"#{input["tier1_country"]}",
               "contact"=>{
                  "first_name"=>"#{input["tier1_first_name"]}",     
                  "last_name"=>"#{input["tier1_last_name"]}",    
                  "email"=>"#{input["tier1_email"]}",    
                  "phone_number"=>{
                     "country_code"=>"",
                     "area_code"=>"",
                     "phone_number"=>"",
                     "extension"=>""
                  }
               }
            }
           
         }
      }
   },
   "marketplace"=>{
      "id"=>"MP-90040"
   }
  }  
        post("https://api.connect.cloudblue.com/public/v1/requests", hardcoded_params).
          after_error_response(/.*/) do |_, body, _, message|
            error("#{message}: #{body}")
          end
      end,
      
      output_fields: lambda do |object_definitions|
        object_definitions["purchase_request"]
      end
    },
        
    
    
    change_items_quantity: {
      title: "Change items quantity",
      subtitle: "",
      description: "",
      help: "",
      
              #"global_id": input["items"],
              #"quantity": input["quantity"],
      input_fields: lambda do |object_definitions|
        [
          { 
            name: "items", 
            label: "Changed items list",
            type: "array",
            optional: false,
            properties: [  
              { name: "global_id" },
              { name: "quantity" }     
            ]},
          {
            name: "external_id",
            label: "Asset external ID",
            hint: "",
            optional: false
          },
          {
            name: "external_uid",
            label: "External UID",
            hint: "",
            optional: false
          },
          
          
        ]
      end,
      
      execute: lambda do |connection, input|
        
        payload = {
         "type"=>"change",
         "asset"=>{
           "external_id"=>input["external_id"],
           "external_uid"=>input["external_uid"],
            "items"=>input["items"]
           },
        }
        
        response = post("/public/v1/requests", payload).
        after_error_response(/.*/) do |_, body, _, message|
          parse_json(body)
        end
        #post("/public/v1/requests", payload).
        #after_error_response(/.*/) do |_, body, _, message|
        #  {
        #    data: body
        #  }
        #end
      end,
      
      output_fields: lambda do |object_definitions|
        object_definitions["change_request"]
      end
    },
    
   
  },

  triggers: {
    updated_requests: {
       
      input_fields: lambda do
        [
          {
            name: "product",
            label: "Product",
            control_type: 'select',
            pick_list: "products",
            optional: true
          },
          {
            name: "customer",
            label: "Customer",
            control_type: 'select',
            pick_list: "customers",
            optional: true
          },
          {
            name: "request_types",
            label: "Type(s) of requests",
            hint: "Please specify type(s) of requests to notify about. There should be request types supported by Connect, like 'purchase', 'cancel', 'change', 'suspend', 'resume'. Delimiter is a comma.",
            type: :string,
            optional: false,
            default: "purchase"
          },
          {
            name: "request_status",
            label: "Status of requests",
            hint: "Please specify status which request should have. Trigger will work if request receives this status, or request already in this status is additionally updated.",
            type: :string,
            optional: true,
            default: "approved"
          },
          {
            name: "since",
            type: :timestamp,
            optional: false
          },
          {
            name: "delay",
            type: :integer,
            optional: true,
            default: "0"
          }
        ]
      end,

      poll: lambda do |connection, input, last_updated_since|
        updated_since = (last_updated_since || input['since']).to_time.utc
        adjusted_updated_since = updated_since + input["delay"].to_i.days
        
        uri = "/public/v1/requests?"
        uri = uri + (!input["product"].blank? ? "eq(asset.product.id,#{input["product"]})," : "")
        uri = uri + (!input["customer"].blank? ? "eq(tiers.customer.id,#{input["customer"]})," : "")
        uri = uri + (!input["request_status"].blank? ? "eq(status,#{input["request_status"]})," : "")
        uri = uri + "in(type,(#{input["request_types"]})),"
        uri = uri + "ge(updated,#{adjusted_updated_since.iso8601})"

        requests = get(uri)
        
        requests.each do |request| 
            updated_since = [updated_since, request["updated"].to_time.utc].max
        end
        
        {
          events: requests,
          next_poll: updated_since.iso8601,
          can_poll_more: false
        }
      end,

      dedup: lambda do |request|
        request['id']
      end,

      output_fields: lambda do |object_definitions|
        object_definitions['request']
      end
    },
  },

  pick_lists: {
    # Picklists can be referenced by inputs fields or object_definitions
    # possible arguements - connection
    # see more at https://docs.workato.com/developing-connectors/sdk/sdk-reference/picklists.html

  },

  # Reusable methods can be called from object_definitions, picklists or actions
  # See more at https://docs.workato.com/developing-connectors/sdk/sdk-reference/methods.html
  methods: {
  }
}
