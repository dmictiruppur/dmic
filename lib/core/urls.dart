class URLs {
  //static const UrlIp = 'http://192.168.1.6';
  //
  //static const UrlIp = 'http://122.165.202.127:8083';

  static const graphql = 'http://localhost/yst/api/graphql';
  /*static const baseUrl = 'http://192.168.1.202/yst/porutham_api/api';
  static const authLocal = '$baseUrl/login';*/
  static const UrlIp = 'http://192.168.1.202';
  static const baseUrl = '$UrlIp/yst/porutham/api';
  static const ImgUrl = '$UrlIp/yst/porutham/admin/files/members';
  static const paymentGateway_tracknpay =
      UrlIp + '/yst/porutham/member/payment/pay_order.php';

  /*static const UrlIp = 'http://dmic.in';
  static const baseUrl = '$UrlIp/api';
  static const ImgUrl = '$UrlIp/admin/files/members';
  static const paymentGateway_tracknpay =
      UrlIp + '/member/payment/pay_order.php';*/

  static const authLocal = '$baseUrl/userlogin';
  static const profile_image_upload = '$baseUrl/upload_profile_photo.php';
  static const upload_fullsize_photo = '$baseUrl/upload_fullsize_photo.php';
  static const upload_aadhar_photo = '$baseUrl/upload_aadhar_photo.php';

  /*static const baseUrl = 'http://192.168.1.202/erp/oe_erp/api';
  static const authLocal = '$baseUrl/userlogin';*/

  static const registerLocal = '$baseUrl/register';
  static const myprofileview = '$baseUrl/myprofile_view';
  static const categories = '$baseUrl/categories';
  static const products = '$baseUrl/products';
  static const stores = '$baseUrl/stores';
  static const paymentTypes = '$baseUrl/payment-types';
  static const orders = '$baseUrl/orders';
  static const users = '$baseUrl/users';
  static const orderdetail = '$baseUrl/member_list';
  static const search_members = '$baseUrl/search_members';
  static const myprofile_view = '$baseUrl/myprofile_view';
  static const unlockprofile5 = '$baseUrl/get_unlockprofilelist_5';
  static const unlock_profile = '$baseUrl/unlock_profile';
  static const single_member_detail = '$baseUrl/single_member_detail';
  static const get_kolamlist = '$baseUrl/get_kolamlist';
  static const get_maritualstatuslist = '$baseUrl/get_maritualstatuslist';
  static const get_raasilist = '$baseUrl/get_raasilist';
  static const get_starlist = '$baseUrl/get_starlist';
  static const show_paymentlist = '$baseUrl/show_paymentlist';
  static const member_image = '$baseUrl/member_image';
  static const delete_profile_image = '$baseUrl/delete_profile_image';
  static const delete_fullsize_image = '$baseUrl/delete_fullsize_image';
  static const delete_aadhar_image = '$baseUrl/delete_aadhar_image';
  static const generate_pdf = '$baseUrl/generate_pdf';
  static const member_profile_view = '$baseUrl/member_profile_view';
  static const get_version = '$baseUrl/get_version';
  static const member_register = '$baseUrl/member_register';
}
