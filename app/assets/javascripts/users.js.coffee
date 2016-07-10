# $ ->
#   initialize_users_typeahead = ->
#     users_typeahead = new Bloodhound(
#       datumTokenizer: Bloodhound.tokenizers.obj.whitespace(
#         "name", "email"
#       ),
#       queryTokenizer: Bloodhound.tokenizers.whitespace,
#       prefetch: "/users/autocomplete"
#     )
#
#     users_typeahead.initialize()
#
#     $(".js-user-autocomplete").typeahead null,
#       displayKey: "email"
#       source: users_typeahead.ttAdapter()
#       templates:
#         suggestion: Handlebars.compile("
#           <div>
#             {{#if name}}
#               Name: <strong>{{name}}</strong>
#             {{/if}}
#             {{#if email}}
#               Email: <strong>{{email}}</strong>
#             {{/if}}
#           </div>
#         ")
#   initialize_users_typeahead()
