class Expenses extends React.Component {
  render () {
    return (
      <div>
        <div>Expenses: {this.props.expenses.length}</div>
      </div>
    );
  }
}

Expenses.propTypes = {
  expenses: React.PropTypes.array
};
