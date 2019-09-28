const AUTH = """
  query(\$email: String!, \$password: String!, \$userType: Int) {
    userLogin(email: \$email, password: \$password, userType: \$userType) {
      token
      userId
      userName
      userType
    }
  }
""";
