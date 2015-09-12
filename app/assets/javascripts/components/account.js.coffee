@Account = React.createClass
  propTypes:
    name: React.PropTypes.string
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.account.id
      React.DOM.td null, @props.account.name
