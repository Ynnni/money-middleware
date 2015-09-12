@Account = React.createClass
  getInitialState: ->
    edit: false
  propTypes:
    name: React.PropTypes.string
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleUpdate: (e) ->
    e.preventDefault()
    data =
      name: React.findDOMNode(@refs.name).value
    $.ajax
      method: 'PATCH'
      url: "/accounts/#{ @props.account.id }"
      dataType: 'json'
      data:
        account: data
      success: (data) =>
        @setState edit: false
        @props.update @props.account, data
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/accounts/#{ @props.account.id }"
      dataType: 'json'
      success: =>
        @props.delete @props.account
  row: ->
    React.DOM.tr null,
      React.DOM.td null, @props.account.id
      React.DOM.td null, @props.account.name
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
  form: ->
    React.DOM.tr null,
      React.DOM.td null, @props.account.id
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.account.name
          ref: 'name'
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-default'
          onClick: @handleUpdate
          'Update'
        React.DOM.button
          className: 'btn btn-default'
          onClick: @handleToggle
          'Cancel'
  render: ->
    if @state.edit
      @form()
    else
      @row()