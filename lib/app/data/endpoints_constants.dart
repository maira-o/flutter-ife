
class EndPointConstants {
  // Base URL
  static String baseURL = "https://app-ife-gateway.herokuapp.com/";

  // Teacher Constants
    // Get
    static String getActivities(String userId) => baseURL + "educador/atividade/$userId";
  
    // Post
    static String createActivity = baseURL + "educador/atividade";
    static String editActivity(String atividadeId) => baseURL + "educador/atividade/$atividadeId";
    static String deleteActivity(String atividadeId) => baseURL + "educador/atividade/$atividadeId";

  // Child Constants
    //Get
    static String getSupports = baseURL + "crianca/apoio";
    static String getChildrenByEducator(String userId) => baseURL + "crianca/buscaCriancasEducador/$userId";
    

    // Post
    static String includeSupport = baseURL + "crianca/apoio";
    static String deleteSupport(String supportId) => baseURL + "crianca/apoio/$supportId";

  // POST Constants
  static String login = baseURL + "login";
  static String user = baseURL + "usuario";
}