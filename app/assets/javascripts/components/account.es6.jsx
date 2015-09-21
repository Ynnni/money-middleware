class Account extends React.Component {
  constructor () {
    super()
    this.state = { edit: false }
  }

  toggle (e) {
    e.preventDefault()
    this.setState({ edit: !this.state.edit })
  }

  update (e) {
    e.preventDefault()
    data = {
      name: React.findDOMNode(this.refs.name).value
    }
    $.ajax({
      method: "PATCH",
      url: `/accounts/${ this.props.account.id }`,
      dataType: 'json',
      data: {
        account: data
      },
      success: (data) => {
        this.setState({ edit: false })
        this.props.update(this.props.account, data)
      }
    })
  }

  delete (e) {
    e.preventDefault()
    $.ajax({
      method: 'DELETE',
      url: `/accounts/${ this.props.account.id }`,
      dataType: 'json',
      success: () => {
        this.props.delete(this.props.account)
      }
    })
  }

  row () {
    return (
      <tr>
        <td>{this.props.account.id}</td>
        <td>{this.props.account.name}</td>
        <td>
          <button className="btn btn-default" onClick={this.toggle.bind(this)}>Edit</button>
          <button className="btn btn-danger" onClick={this.delete.bind(this)}>Delete</button>
        </td>
      </tr>
    )
  }

  form () {
    return(
      <tr>
        <td>{this.props.account.id}</td>
        <td>
          <input className="form-control" type="text" defaultValue={this.props.account.name} ref="name"></input>
        </td>
        <td>
          <button className="btn btn-default" onClick={this.update.bind(this)}>Update</button>
          <button className="btn btn-default" onClick={this.toggle.bind(this)}>Cancel</button>
        </td>
      </tr>
    )
  }

  render () {
    if (this.state.edit){
      return this.form()
    } else {
      return this.row()
    }
  }
}
