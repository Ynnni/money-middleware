@AccountForm = React.createClass
  getInitialState: ->
    name: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '',
      { account: @state }
      (data) =>
        @props.handleNewRecord data
        @setState @getInitialState()
      'json'
  valid: ->
    @state.name
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit  
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Name'
          name: 'name'
          value: @state.name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'    
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Create Account'  