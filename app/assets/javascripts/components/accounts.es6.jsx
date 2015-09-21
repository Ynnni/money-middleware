class Accounts extends React.Component {
  constructor () {
    super()
    this.state = { accounts: [] }
    this.fetch()
  }

  fetch () {
    $.ajax({
      url: "/accounts",
      dataType: "json",
      success: (function(accounts) {
        this.setState({ accounts: accounts })
      }).bind(this)
    })
  }

  add (account) {
    accounts = React.addons.update(this.state.accounts, { $push: [account] })
    this.setState({ accounts: accounts })
  }

  update (account, data) {
    index = this.state.accounts.indexOf(account)
    accounts = React.addons.update(this.state.accounts, { $splice: [[index, 1, data]] })
    this.setState({ accounts: accounts })
  }

  delete (account) {
    index = this.state.accounts.indexOf(account)
    accounts = React.addons.update(this.state.accounts, { $splice: [[index, 1]] })
    this.setState({ accounts: accounts })
  }

  render () {
    var accounts = this.state.accounts.map((account) => {
      return <Account delete={this.delete.bind(this)} update={this.update.bind(this)} key={account.id} account={account} />
    })

    return(
      <div className="Accounts">
        <h2 className="title">Accounts</h2>
        <AccountForm add={this.add.bind(this)}/>
        <hr/>
        <table className="table table-bordered">
          <thead>
            <tr>
              <td>Id</td>
              <td>Name</td>
              <td>Actions</td>
            </tr>
          </thead>
          <tbody>
            {accounts}
          </tbody>
        </table>
      </div>
    )
  }
}
