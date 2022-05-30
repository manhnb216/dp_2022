import 'dart:developer';

enum EmployeePosition { teamLead, manager }

class EmployeeFactory {
  static EmployeeComponent employeeComponent = EmployeeConcreteComponent('test');
  static EmployeeComponent getEmployee(EmployeePosition position) {
    switch (position) {
      case EmployeePosition.teamLead:
        return TeamLeader(employeeComponent);
      case EmployeePosition.manager:
        return Manager(employeeComponent);
    }
  }
}

class TeamLeader extends EmployeeDecoration {
  TeamLeader(super.employeeComponent);

  void planning() {
    log('${employeeComponent.getName()} is planning requirements.');
  }

  void motivate() {
    log('${employeeComponent.getName()} is motivating requirements.');
  }

  @override
  void doSmt() {
    employeeComponent.doSmt();
    planning();
    motivate();
  }
}

class Manager extends EmployeeDecoration {
  Manager(super.employeeComponent);

  void createRequirement() {
    log('${employeeComponent.getName()} is creating requirements.');
  }

  void assignTask() {
    log('${employeeComponent.getName()} is assigning tasks.');
  }

  @override
  void doSmt() {
    employeeComponent.doSmt();
    createRequirement();
    assignTask();
  }
}

class EmployeeDecoration implements EmployeeComponent {
  EmployeeComponent employeeComponent;

  EmployeeDecoration(this.employeeComponent);

  @override
  String getName() {
    return employeeComponent.getName();
  }

  @override
  void doSmt() {}
}

class EmployeeConcreteComponent implements EmployeeComponent {
  late final String name;

  EmployeeConcreteComponent(this.name);

  @override
  void doSmt() {}

  @override
  String getName() {
    return name;
  }
}

abstract class EmployeeComponent {
  String getName();
  void doSmt();
}
