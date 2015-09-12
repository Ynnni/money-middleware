@Accounts = React.createClass
  getInitialState: ->
    accounts: @props.data
  getDefaultProps: ->
    accounts: []  
  add: (account) ->
    accounts = React.addons.update @state.accounts, { $push: [account] }
    @setState accounts: accounts
  delete: (account) ->
    index = @state.accounts.indexOf account
    accounts = React.addons.update @state.accounts, { $splice: [[index, 1]] }
    @replaceState accounts: accounts
  render: ->
    React.DOM.div
      className: 'accounts'
      React.DOM.h2
        className: 'title'
        'Accounts'
      React.createElement AccountForm, add: @add
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
              React.DOM.th null, 'Id'
              React.DOM.th null, 'Name'
              React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for account in @state.accounts
            React.createElement Account, delete: @delete, key: account.id, account: account