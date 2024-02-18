class LoginModel {
  User? user;
  String? jwt;

  LoginModel({this.user, this.jwt});

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    jwt = json['jwt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['jwt'] = jwt;
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? email;
  bool? blocked;
  String? id;
  String? created;
  String? updated;
  String? company;
  Role? companyDetail;
  List<Roles>? roles;

  User(
      {this.firstName,
        this.lastName,
        this.email,
        this.blocked,
        this.id,
        this.created,
        this.updated,
        this.company,
        this.companyDetail,
        this.roles});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    blocked = json['blocked'];
    id = json['id'];
    created = json['created'];
    updated = json['updated'];
    company = json['company'];
    companyDetail = json['Company'] != null ? Role.fromJson(json['Company']) : null;
    if (json['Roles'] != null) {
      roles = <Roles>[];
      json['Roles'].forEach((v) {
        roles?.add(Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['blocked'] = blocked;
    data['id'] = id;
    data['created'] = created;
    data['updated'] = updated;
    data['company'] = company;
    if (companyDetail != null) {
      data['Company'] = companyDetail?.toJson();
    }
    if (roles != null) {
      data['Roles'] = roles?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Company {
  String? name;
  String? phone;
  String? address;
  String? website;
  String? email;
  String? ndisRegistrationNumber;
  String? timezone;
  String? abn;
  String? accountBsb;
  String? accountNumber;
  String? accountName;
  String? id;
  String? created;
  String? updated;
  String? attachment;

  Company(
      {this.name,
        this.phone,
        this.address,
        this.website,
        this.email,
        this.ndisRegistrationNumber,
        this.timezone,
        this.abn,
        this.accountBsb,
        this.accountNumber,
        this.accountName,
        this.id,
        this.created,
        this.updated,
        this.attachment});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    website = json['website'];
    email = json['email'];
    ndisRegistrationNumber = json['ndisRegistrationNumber'];
    timezone = json['timezone'];
    abn = json['abn'];
    accountBsb = json['accountBsb'];
    accountNumber = json['accountNumber'];
    accountName = json['accountName'];
    id = json['id'];
    created = json['created'];
    updated = json['updated'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['website'] = website;
    data['email'] = email;
    data['ndisRegistrationNumber'] = ndisRegistrationNumber;
    data['timezone'] = timezone;
    data['abn'] = abn;
    data['accountBsb'] = accountBsb;
    data['accountNumber'] = accountNumber;
    data['accountName'] = accountName;
    data['id'] = id;
    data['created'] = created;
    data['updated'] = updated;
    data['attachment'] = attachment;
    return data;
  }
}

class Roles {
  String? name;
  String? description;
  Permissions? permissions;
  String? id;
  String? created;
  String? updated;
  String? company;

  Roles(
      {this.name,
        this.description,
        this.permissions,
        this.id,
        this.created,
        this.updated,
        this.company});

  Roles.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    permissions = json['permissions'] != null
        ? Permissions.fromJson(json['permissions'])
        : null;
    id = json['id'];
    created = json['created'];
    updated = json['updated'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['description'] = description;
    if (permissions != null) {
      data['permissions'] = permissions?.toJson();
    }
    data['id'] = id;
    data['created'] = created;
    data['updated'] = updated;
    data['company'] = company;
    return data;
  }
}

class Permissions {
  Role? role;
  Role? site;
  Role? team;
  Role? policy;
  Role? roster;
  Role? whsLog;
  Role? company;
  Role? expense;
  Role? invoice;
  Role? myShift;
  Role? process;
  Role? bowelLog;
  Role? feedback;
  Role? resource;
  Role? sleepLog;
  Role? template;
  Role? onCallLog;
  Role? timesheet;
  Role? weightLog;
  Role? clientRisk;
  Role? meetingLog;
  Role? seizureLog;
  Role? vehicleLog;
  Role? clientAsset;
  Role? doctorVisit;
  Role? integration;
  Role? keyDecision;
  Role? prnAdminLog;
  Role? companyAsset;
  Role? injuryReport;
  Role? policyReview;
  Role? progressNote;
  Role? staffProfile;
  Role? clientProfile;
  Role? corporateRisk;
  Role? practiceGuide;
  Role? prnBalanceLog;
  Role? repairRequest;
  Role? rosterSetting;
  Role? rpdhsResource;
  Role? staffArchived;
  Role? staffDocument;
  Role? clientArchived;
  Role? clientDocument;
  Role? companyExpense;
  Role? incidentReport;
  Role? maintenanceLog;
  Role? progressReport;
  Role? temperatureLog;
  Role? bloodGlucoseLog;
  Role? clientBehaviour;
  Role? participantGoal;
  Role? serviceDelivery;
  Role? bloodPressureLog;
  Role? externalContract;
  Role? internalRegister;
  Role? leadershipMeeting;
  Role? staffDocumentType;
  Role? alertConfiguration;
  Role? clientDocumentType;
  Role? conflictOfInterest;
  Role? leaseAndUtilityLog;
  Role? medicationRegister;
  Role? participantExpense;
  Role? legislationRegister;
  Role? oxygenSaturationLog;
  Role? staffSupervisionLog;
  Role? expenseReimbursement;
  Role? progressNoteSettings;
  Role? regulatoryCompliance;
  Role? continuousImprovement;
  Role? staffDocumentCategory;
  Role? staffSleepDisturbance;
  Role? clientDocumentCategory;
  Role? restrictivePracticeLog;
  Role? participantMedicationChart;
  Role? participantCommunicationLog;
  Role? restrictivePracticeRegister;
  Role? participantConfidentialDocument;

  Permissions(
      {this.role,
        this.site,
        this.team,
        this.policy,
        this.roster,
        this.whsLog,
        this.company,
        this.expense,
        this.invoice,
        this.myShift,
        this.process,
        this.bowelLog,
        this.feedback,
        this.resource,
        this.sleepLog,
        this.template,
        this.onCallLog,
        this.timesheet,
        this.weightLog,
        this.clientRisk,
        this.meetingLog,
        this.seizureLog,
        this.vehicleLog,
        this.clientAsset,
        this.doctorVisit,
        this.integration,
        this.keyDecision,
        this.prnAdminLog,
        this.companyAsset,
        this.injuryReport,
        this.policyReview,
        this.progressNote,
        this.staffProfile,
        this.clientProfile,
        this.corporateRisk,
        this.practiceGuide,
        this.prnBalanceLog,
        this.repairRequest,
        this.rosterSetting,
        this.rpdhsResource,
        this.staffArchived,
        this.staffDocument,
        this.clientArchived,
        this.clientDocument,
        this.companyExpense,
        this.incidentReport,
        this.maintenanceLog,
        this.progressReport,
        this.temperatureLog,
        this.bloodGlucoseLog,
        this.clientBehaviour,
        this.participantGoal,
        this.serviceDelivery,
        this.bloodPressureLog,
        this.externalContract,
        this.internalRegister,
        this.leadershipMeeting,
        this.staffDocumentType,
        this.alertConfiguration,
        this.clientDocumentType,
        this.conflictOfInterest,
        this.leaseAndUtilityLog,
        this.medicationRegister,
        this.participantExpense,
        this.legislationRegister,
        this.oxygenSaturationLog,
        this.staffSupervisionLog,
        this.expenseReimbursement,
        this.progressNoteSettings,
        this.regulatoryCompliance,
        this.continuousImprovement,
        this.staffDocumentCategory,
        this.staffSleepDisturbance,
        this.clientDocumentCategory,
        this.restrictivePracticeLog,
        this.participantMedicationChart,
        this.participantCommunicationLog,
        this.restrictivePracticeRegister,
        this.participantConfidentialDocument});

  Permissions.fromJson(Map<String, dynamic> json) {
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    site = json['site'] != null ? Role.fromJson(json['site']) : null;
    team = json['team'] != null ? Role.fromJson(json['team']) : null;
    policy = json['policy'] != null ? Role.fromJson(json['policy']) : null;
    roster = json['roster'] != null ? Role.fromJson(json['roster']) : null;
    whsLog = json['whsLog'] != null ? Role.fromJson(json['whsLog']) : null;
    company =
    json['company'] != null ? Role.fromJson(json['company']) : null;
    expense =
    json['expense'] != null ? Role.fromJson(json['expense']) : null;
    invoice =
    json['invoice'] != null ? Role.fromJson(json['invoice']) : null;
    myShift =
    json['myShift'] != null ? Role.fromJson(json['myShift']) : null;
    process =
    json['process'] != null ? Role.fromJson(json['process']) : null;
    bowelLog =
    json['bowelLog'] != null ? Role.fromJson(json['bowelLog']) : null;
    feedback =
    json['feedback'] != null ? Role.fromJson(json['feedback']) : null;
    resource =
    json['resource'] != null ? Role.fromJson(json['resource']) : null;
    sleepLog =
    json['sleepLog'] != null ? Role.fromJson(json['sleepLog']) : null;
    template =
    json['template'] != null ? Role.fromJson(json['template']) : null;
    onCallLog =
    json['onCallLog'] != null ? Role.fromJson(json['onCallLog']) : null;
    timesheet =
    json['timesheet'] != null ? Role.fromJson(json['timesheet']) : null;
    weightLog =
    json['weightLog'] != null ? Role.fromJson(json['weightLog']) : null;
    clientRisk = json['clientRisk'] != null
        ? Role.fromJson(json['clientRisk'])
        : null;
    meetingLog = json['meetingLog'] != null
        ? Role.fromJson(json['meetingLog'])
        : null;
    seizureLog = json['seizureLog'] != null
        ? Role.fromJson(json['seizureLog'])
        : null;
    vehicleLog = json['vehicleLog'] != null
        ? Role.fromJson(json['vehicleLog'])
        : null;
    clientAsset = json['clientAsset'] != null
        ? Role.fromJson(json['clientAsset'])
        : null;
    doctorVisit = json['doctorVisit'] != null
        ? Role.fromJson(json['doctorVisit'])
        : null;
    integration = json['integration'] != null
        ? Role.fromJson(json['integration'])
        : null;
    keyDecision = json['keyDecision'] != null
        ? Role.fromJson(json['keyDecision'])
        : null;
    prnAdminLog = json['prnAdminLog'] != null
        ? Role.fromJson(json['prnAdminLog'])
        : null;
    companyAsset = json['companyAsset'] != null
        ? Role.fromJson(json['companyAsset'])
        : null;
    injuryReport = json['injuryReport'] != null
        ? Role.fromJson(json['injuryReport'])
        : null;
    policyReview = json['policyReview'] != null
        ? Role.fromJson(json['policyReview'])
        : null;
    progressNote = json['progressNote'] != null
        ? Role.fromJson(json['progressNote'])
        : null;
    staffProfile = json['staffProfile'] != null
        ? Role.fromJson(json['staffProfile'])
        : null;
    clientProfile = json['clientProfile'] != null
        ? Role.fromJson(json['clientProfile'])
        : null;
    corporateRisk = json['corporateRisk'] != null
        ? Role.fromJson(json['corporateRisk'])
        : null;
    practiceGuide = json['practiceGuide'] != null
        ? Role.fromJson(json['practiceGuide'])
        : null;
    prnBalanceLog = json['prnBalanceLog'] != null
        ? Role.fromJson(json['prnBalanceLog'])
        : null;
    repairRequest = json['repairRequest'] != null
        ? Role.fromJson(json['repairRequest'])
        : null;
    rosterSetting = json['rosterSetting'] != null
        ? Role.fromJson(json['rosterSetting'])
        : null;
    rpdhsResource = json['rpdhsResource'] != null
        ? Role.fromJson(json['rpdhsResource'])
        : null;
    staffArchived = json['staffArchived'] != null
        ? Role.fromJson(json['staffArchived'])
        : null;
    staffDocument = json['staffDocument'] != null
        ? Role.fromJson(json['staffDocument'])
        : null;
    clientArchived = json['clientArchived'] != null
        ? Role.fromJson(json['clientArchived'])
        : null;
    clientDocument = json['clientDocument'] != null
        ? Role.fromJson(json['clientDocument'])
        : null;
    companyExpense = json['companyExpense'] != null
        ? Role.fromJson(json['companyExpense'])
        : null;
    incidentReport = json['incidentReport'] != null
        ? Role.fromJson(json['incidentReport'])
        : null;
    maintenanceLog = json['maintenanceLog'] != null
        ? Role.fromJson(json['maintenanceLog'])
        : null;
    progressReport = json['progressReport'] != null
        ? Role.fromJson(json['progressReport'])
        : null;
    temperatureLog = json['temperatureLog'] != null
        ? Role.fromJson(json['temperatureLog'])
        : null;
    bloodGlucoseLog = json['bloodGlucoseLog'] != null
        ? Role.fromJson(json['bloodGlucoseLog'])
        : null;
    clientBehaviour = json['clientBehaviour'] != null
        ? Role.fromJson(json['clientBehaviour'])
        : null;
    participantGoal = json['participantGoal'] != null
        ? Role.fromJson(json['participantGoal'])
        : null;
    serviceDelivery = json['serviceDelivery'] != null
        ? Role.fromJson(json['serviceDelivery'])
        : null;
    bloodPressureLog = json['bloodPressureLog'] != null
        ? Role.fromJson(json['bloodPressureLog'])
        : null;
    externalContract = json['externalContract'] != null
        ? Role.fromJson(json['externalContract'])
        : null;
    internalRegister = json['internalRegister'] != null
        ? Role.fromJson(json['internalRegister'])
        : null;
    leadershipMeeting = json['leadershipMeeting'] != null
        ? Role.fromJson(json['leadershipMeeting'])
        : null;
    staffDocumentType = json['staffDocumentType'] != null
        ? Role.fromJson(json['staffDocumentType'])
        : null;
    alertConfiguration = json['alertConfiguration'] != null
        ? Role.fromJson(json['alertConfiguration'])
        : null;
    clientDocumentType = json['clientDocumentType'] != null
        ? Role.fromJson(json['clientDocumentType'])
        : null;
    conflictOfInterest = json['conflictOfInterest'] != null
        ? Role.fromJson(json['conflictOfInterest'])
        : null;
    leaseAndUtilityLog = json['leaseAndUtilityLog'] != null
        ? Role.fromJson(json['leaseAndUtilityLog'])
        : null;
    medicationRegister = json['medicationRegister'] != null
        ? Role.fromJson(json['medicationRegister'])
        : null;
    participantExpense = json['participantExpense'] != null
        ? Role.fromJson(json['participantExpense'])
        : null;
    legislationRegister = json['legislationRegister'] != null
        ? Role.fromJson(json['legislationRegister'])
        : null;
    oxygenSaturationLog = json['oxygenSaturationLog'] != null
        ? Role.fromJson(json['oxygenSaturationLog'])
        : null;
    staffSupervisionLog = json['staffSupervisionLog'] != null
        ? Role.fromJson(json['staffSupervisionLog'])
        : null;
    expenseReimbursement = json['expenseReimbursement'] != null
        ? Role.fromJson(json['expenseReimbursement'])
        : null;
    progressNoteSettings = json['progressNoteSettings'] != null
        ? Role.fromJson(json['progressNoteSettings'])
        : null;
    regulatoryCompliance = json['regulatoryCompliance'] != null
        ? Role.fromJson(json['regulatoryCompliance'])
        : null;
    continuousImprovement = json['continuousImprovement'] != null
        ? Role.fromJson(json['continuousImprovement'])
        : null;
    staffDocumentCategory = json['staffDocumentCategory'] != null
        ? Role.fromJson(json['staffDocumentCategory'])
        : null;
    staffSleepDisturbance = json['staffSleepDisturbance'] != null
        ? Role.fromJson(json['staffSleepDisturbance'])
        : null;
    clientDocumentCategory = json['clientDocumentCategory'] != null
        ? Role.fromJson(json['clientDocumentCategory'])
        : null;
    restrictivePracticeLog = json['restrictivePracticeLog'] != null
        ? Role.fromJson(json['restrictivePracticeLog'])
        : null;
    participantMedicationChart = json['participantMedicationChart'] != null
        ? Role.fromJson(json['participantMedicationChart'])
        : null;
    participantCommunicationLog = json['participantCommunicationLog'] != null
        ? Role.fromJson(json['participantCommunicationLog'])
        : null;
    restrictivePracticeRegister = json['restrictivePracticeRegister'] != null
        ? Role.fromJson(json['restrictivePracticeRegister'])
        : null;
    participantConfidentialDocument =
    json['participantConfidentialDocument'] != null
        ? Role.fromJson(json['participantConfidentialDocument'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (role != null) {
      data['role'] = role?.toJson();
    }
    if (site != null) {
      data['site'] = site?.toJson();
    }
    if (team != null) {
      data['team'] = team?.toJson();
    }
    if (policy != null) {
      data['policy'] = policy?.toJson();
    }
    if (roster != null) {
      data['roster'] = roster?.toJson();
    }
    if (whsLog != null) {
      data['whsLog'] = whsLog?.toJson();
    }
    if (company != null) {
      data['company'] = company?.toJson();
    }
    if (expense != null) {
      data['expense'] = expense?.toJson();
    }
    if (invoice != null) {
      data['invoice'] = invoice?.toJson();
    }
    if (myShift != null) {
      data['myShift'] = myShift?.toJson();
    }
    if (process != null) {
      data['process'] = process?.toJson();
    }
    if (bowelLog != null) {
      data['bowelLog'] = bowelLog?.toJson();
    }
    if (feedback != null) {
      data['feedback'] = feedback?.toJson();
    }
    if (resource != null) {
      data['resource'] = resource?.toJson();
    }
    if (sleepLog != null) {
      data['sleepLog'] = sleepLog?.toJson();
    }
    if (template != null) {
      data['template'] = template?.toJson();
    }
    if (onCallLog != null) {
      data['onCallLog'] = onCallLog?.toJson();
    }
    if (timesheet != null) {
      data['timesheet'] = timesheet?.toJson();
    }
    if (weightLog != null) {
      data['weightLog'] = weightLog?.toJson();
    }
    if (clientRisk != null) {
      data['clientRisk'] = clientRisk?.toJson();
    }
    if (meetingLog != null) {
      data['meetingLog'] = meetingLog?.toJson();
    }
    if (seizureLog != null) {
      data['seizureLog'] = seizureLog?.toJson();
    }
    if (vehicleLog != null) {
      data['vehicleLog'] = vehicleLog?.toJson();
    }
    if (clientAsset != null) {
      data['clientAsset'] = clientAsset?.toJson();
    }
    if (doctorVisit != null) {
      data['doctorVisit'] = doctorVisit?.toJson();
    }
    if (integration != null) {
      data['integration'] = integration?.toJson();
    }
    if (keyDecision != null) {
      data['keyDecision'] = keyDecision?.toJson();
    }
    if (prnAdminLog != null) {
      data['prnAdminLog'] = prnAdminLog?.toJson();
    }
    if (companyAsset != null) {
      data['companyAsset'] = companyAsset?.toJson();
    }
    if (injuryReport != null) {
      data['injuryReport'] = injuryReport?.toJson();
    }
    if (policyReview != null) {
      data['policyReview'] = policyReview?.toJson();
    }
    if (progressNote != null) {
      data['progressNote'] = progressNote?.toJson();
    }
    if (staffProfile != null) {
      data['staffProfile'] = staffProfile?.toJson();
    }
    if (clientProfile != null) {
      data['clientProfile'] = clientProfile?.toJson();
    }
    if (corporateRisk != null) {
      data['corporateRisk'] = corporateRisk?.toJson();
    }
    if (practiceGuide != null) {
      data['practiceGuide'] = practiceGuide?.toJson();
    }
    if (prnBalanceLog != null) {
      data['prnBalanceLog'] = prnBalanceLog?.toJson();
    }
    if (repairRequest != null) {
      data['repairRequest'] = repairRequest?.toJson();
    }
    if (rosterSetting != null) {
      data['rosterSetting'] = rosterSetting?.toJson();
    }
    if (rpdhsResource != null) {
      data['rpdhsResource'] = rpdhsResource?.toJson();
    }
    if (staffArchived != null) {
      data['staffArchived'] = staffArchived?.toJson();
    }
    if (staffDocument != null) {
      data['staffDocument'] = staffDocument?.toJson();
    }
    if (clientArchived != null) {
      data['clientArchived'] = clientArchived?.toJson();
    }
    if (clientDocument != null) {
      data['clientDocument'] = clientDocument?.toJson();
    }
    if (companyExpense != null) {
      data['companyExpense'] = companyExpense?.toJson();
    }
    if (incidentReport != null) {
      data['incidentReport'] = incidentReport?.toJson();
    }
    if (maintenanceLog != null) {
      data['maintenanceLog'] = maintenanceLog?.toJson();
    }
    if (progressReport != null) {
      data['progressReport'] = progressReport?.toJson();
    }
    if (temperatureLog != null) {
      data['temperatureLog'] = temperatureLog?.toJson();
    }
    if (bloodGlucoseLog != null) {
      data['bloodGlucoseLog'] = bloodGlucoseLog?.toJson();
    }
    if (clientBehaviour != null) {
      data['clientBehaviour'] = clientBehaviour?.toJson();
    }
    if (participantGoal != null) {
      data['participantGoal'] = participantGoal?.toJson();
    }
    if (serviceDelivery != null) {
      data['serviceDelivery'] = serviceDelivery?.toJson();
    }
    if (bloodPressureLog != null) {
      data['bloodPressureLog'] = bloodPressureLog?.toJson();
    }
    if (externalContract != null) {
      data['externalContract'] = externalContract?.toJson();
    }
    if (internalRegister != null) {
      data['internalRegister'] = internalRegister?.toJson();
    }
    if (leadershipMeeting != null) {
      data['leadershipMeeting'] = leadershipMeeting?.toJson();
    }
    if (staffDocumentType != null) {
      data['staffDocumentType'] = staffDocumentType?.toJson();
    }
    if (alertConfiguration != null) {
      data['alertConfiguration'] = alertConfiguration?.toJson();
    }
    if (clientDocumentType != null) {
      data['clientDocumentType'] = clientDocumentType?.toJson();
    }
    if (conflictOfInterest != null) {
      data['conflictOfInterest'] = conflictOfInterest?.toJson();
    }
    if (leaseAndUtilityLog != null) {
      data['leaseAndUtilityLog'] = leaseAndUtilityLog?.toJson();
    }
    if (medicationRegister != null) {
      data['medicationRegister'] = medicationRegister?.toJson();
    }
    if (participantExpense != null) {
      data['participantExpense'] = participantExpense?.toJson();
    }
    if (legislationRegister != null) {
      data['legislationRegister'] = legislationRegister?.toJson();
    }
    if (oxygenSaturationLog != null) {
      data['oxygenSaturationLog'] = oxygenSaturationLog?.toJson();
    }
    if (staffSupervisionLog != null) {
      data['staffSupervisionLog'] = staffSupervisionLog?.toJson();
    }
    if (expenseReimbursement != null) {
      data['expenseReimbursement'] = expenseReimbursement?.toJson();
    }
    if (progressNoteSettings != null) {
      data['progressNoteSettings'] = progressNoteSettings?.toJson();
    }
    if (regulatoryCompliance != null) {
      data['regulatoryCompliance'] = regulatoryCompliance?.toJson();
    }
    if (continuousImprovement != null) {
      data['continuousImprovement'] = continuousImprovement?.toJson();
    }
    if (staffDocumentCategory != null) {
      data['staffDocumentCategory'] = staffDocumentCategory?.toJson();
    }
    if (staffSleepDisturbance != null) {
      data['staffSleepDisturbance'] = staffSleepDisturbance?.toJson();
    }
    if (clientDocumentCategory != null) {
      data['clientDocumentCategory'] = clientDocumentCategory?.toJson();
    }
    if (restrictivePracticeLog != null) {
      data['restrictivePracticeLog'] = restrictivePracticeLog?.toJson();
    }
    if (participantMedicationChart != null) {
      data['participantMedicationChart'] =
          participantMedicationChart?.toJson();
    }
    if (participantCommunicationLog != null) {
      data['participantCommunicationLog'] =
          participantCommunicationLog?.toJson();
    }
    if (restrictivePracticeRegister != null) {
      data['restrictivePracticeRegister'] =
          restrictivePracticeRegister?.toJson();
    }
    if (participantConfidentialDocument != null) {
      data['participantConfidentialDocument'] =
          participantConfidentialDocument?.toJson();
    }
    return data;
  }
}

class Role {
  Actions? actions;

  Role({this.actions});

  Role.fromJson(Map<String, dynamic> json) {
    actions =
    json['actions'] != null ? Actions.fromJson(json['actions']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (actions != null) {
      data['actions'] = actions?.toJson();
    }
    return data;
  }
}

class Actions {
  bool? read;
  bool? create;
  bool? delete;
  bool? update;

  Actions({this.read, this.create, this.delete, this.update});

  Actions.fromJson(Map<String, dynamic> json) {
    read = json['read'];
    create = json['create'];
    delete = json['delete'];
    update = json['update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['read'] = read;
    data['create'] = create;
    data['delete'] = delete;
    data['update'] = update;
    return data;
  }
}

