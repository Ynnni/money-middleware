@Accounts = React.createClass
  getInitialState: ->
    accounts: @props.data
  getDefaultProps: ->
    accounts: []  
  add: (account) ->
    accounts = @state.accounts
    accounts.push account
    @setState accounts: accounts
  render: ->
    React.DOM.div
      className: 'accounts'
      React.DOM.h2
        className: 'title'
        'Accounts'
      React.createElement AccountForm, handleNewRecord: @add
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
              React.DOM.th null, 'Id'
              React.DOM.th null, 'Name'
        React.DOM.tbody null,
          for account in @state.accounts
            React.createElement Account, key: account.id, account: account