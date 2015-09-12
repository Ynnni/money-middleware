@Account = React.createClass
  propTypes:
    name: React.PropTypes.string
  delete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/accounts/#{ @props.account.id }"
      dataType: 'json'
      success: =>
        @props.delete @props.account
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.account.id
      React.DOM.td null, @props.account.name
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @delete
          'Delete'
