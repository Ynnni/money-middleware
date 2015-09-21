class Expense extends React.Component {
  render () {
    return (
      <tr>
        <td>{this.props.id}</td>
        <td>{this.props.amount}</td>
        <td>{this.props.date}</td>
        <td>{this.props.description}</td>
      </tr>
    );
  }
}
