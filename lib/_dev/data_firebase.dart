import 'package:e_commerce/src/models/categories_model.dart';
import 'package:e_commerce/src/models/products_model.dart';

final List<XProduct> listProduct = [
  XProduct(
    id: '1',
    name: 'Sitlly',
    image:
        'https://s3-alpha-sig.figma.com/img/c8d6/cd3c/953d61faf9fd666897e97a67e9857028?Expires=1647820800&Signature=DdzVFhGdW59CzNqm5dYLmOZq3L8saLXUTAEA5uav0d-SLxowrS~vI8y7U8uiIWpPg~JeOe5sqT7IneTtjsFgpcWtdrdBj17g3TgmnDS-yjzO1QNkdITIYIotYwYrZ-ga5dSPahQero7ICZOi0pWA6f2~o873PSd-BwkQlo~VuYwWgX3Zn3M7fuEkwPY~LwVUTgxnnbdGEZhsIWevR39NSGbBAEBYLgMij1Wdp7dKkS6A9pg5psOCeRn5TVrRNyF9xEKzkywg7CSQxNTpW5YSQ5AU-dmPFoJ1L35kn2MgvXfSXBwSdpzWtQlIkiprN2RiBjqggq2THo-53WyU6JxEEg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 10,
    type: 'Sport Dress',
    color: '',
    size: '',
    originalPrice: 22.0,
    discount: 15.0,
    currentPrice: 19.0,
    newProduct: false,
    idCategory: '11',
    nameCategory: 'Dresses',
    soldOut: true,
    amount: 0,
  ),
  XProduct(
    id: '2',
    name: 'Dorothy Perkins',
    image:
        'https://s3-alpha-sig.figma.com/img/9282/7a65/3bcf169c1f1c4b22fc8fc4b86176e01a?Expires=1647820800&Signature=Eyyhm~peThDI9LkXwm7pjwddp3K~IaEs~UgCzTCS~h-sxmDiKPpyyGoz6lpcMAd9qSmWFudfFmmJtF0yvXTcUPNYSvzbO7VsKCoJ0wDV7rMJLMqGf5z7qapmDxw5iMAJCl~EFj3s3bXhYyUAqgl76Y11jeIL3QxhtebaUKAxcJMYdsO3UKT4k0LT9pavxHc0iZyBcoEyIDxIO6F8A0m0baOwJnK~UorcmT97XH3xBmwIN09SZp9OpoZLR9fjhTuulMGk49zroVJ-xv6zvWEDx2amkrhbN-UOjHEYI0jKWVQn2rSoDtuPgJvL2MLToYNb-UEXeYjSiHV7i~xVcnuvvQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 10,
    type: 'Sport Dress',
    color: '',
    size: '',
    originalPrice: 14.0,
    discount: 20.0,
    currentPrice: 12.0,
    newProduct: false,
    idCategory: '11',
    nameCategory: 'Dresses',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
    id: '3',
    name: 'Dorothy Perkins',
    image:
        'https://s3-alpha-sig.figma.com/img/d07c/e180/be1de61431deda2032c364122b021da3?Expires=1647820800&Signature=QiGsfeF5KdGAOsYLdJTkbYvBns9qNYoeFTNnL6~4NGz21OatueNCkPihR6CpMa2uLIsCihIbWe8vZGx~1OZfl07dGdIyyEB2AEc0I7hD4qC13pBZlHxKUoz--qWPWF0glfjevruo3wFIWcWjzIPQFvlH92AvvCmHzLqZPbvMfy6WDuTUMDaG2FKYOiOIoLwrap5fD9dQAa~E5XE6OMhuU-dTEzzL0LKF0TntRebgWbgoRxAbzWtRecXhFyUfq-0VWr2wPAcZxUvH-xbOWwntPpQqsMyDG~5vxRvE-vHNdy-S-Kxj5ET4WPQ0UxZZnNbmp~bj~QHKkSIR2LrAQRhdpw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 10,
    type: 'Blouse',
    color: '',
    size: '',
    originalPrice: 21.0,
    discount: 20.0,
    currentPrice: 14.0,
    newProduct: false,
    idCategory: '2',
    nameCategory: 'Shirts & Blouses',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
    id: '4',
    name: 'Cool',
    image:
        'https://s3-alpha-sig.figma.com/img/ff48/013c/2e83ffc52e71ad79aa63042d84df66ea?Expires=1647820800&Signature=R8XGnyumpYSGIuR1HfpkzZkN0c4b3twLAh7nfh~QCT1X~2eSBQ8RpBOx5kK7tRPCOZLq0v0IKwkeshq96qp36xg7zpq8lZQpZdfoy7YeGDk-4oOPx0iRDphpcqwBSmbaQY88lgkYLVb3qwWTu8yIQ5uGJP75o~WF-vWEOKI7hmoHKLjPWbXW4kV7oEe931cuUlLWsve4kieZ8gSQUd7PZCmYxicRJtw1LW4uv2wmi40aEZObPoYTrcofYu2QBLMBh0VfMoxJ56f8vdOXc98PFFqUOGnyccgV198BWmm5P7~fIimTbIqvxQnGorlqJyv07mey00g6wOxfhY5UFF6q9Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 0,
    type: 'Jeans',
    color: '',
    size: '',
    originalPrice: 45.0,
    discount: 0.0,
    currentPrice: 0.0,
    newProduct: true,
    idCategory: '8',
    nameCategory: 'Jeans',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
    id: '5',
    name: 'T-shirt',
    image:
        'https://s3-alpha-sig.figma.com/img/744c/af4f/8cbe22e0d501d66b730b03c24f793383?Expires=1647820800&Signature=bgrUpOwrsj9ZJ6eZ5s6P7wwhCdK18lsjehZpvZAUmk7TCZqbtYlDcdAEaIXLCJe8mYYmhtNtZobck1eO4hqqZQo3RcfUDlG-r1fThegfjolbWqozeUXVC95ICP-4mIl9vqe6qCubsEiP32neuBs4xmZIIx1-0Yr8zwBVesPfBOoyVciaMGqWnx6ONZfprrG0uaO7eKD7cYSgyMKG18qEogfMgB5ReZ~BY8TUzCLA-Y7lnmFkqhfaiga1Kb5fSwEJ1Ex9Ua-yqNbW6qfJsLiOEHAsLtaUrtX1fFLvzF6bN2yzPjlwqwn1LUocQ058pYmrtA3LN1H9PibHZfUoSfl7OA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 10,
    type: 'LOST Ink',
    color: '',
    size: '',
    originalPrice: 12.0,
    discount: 0.0,
    currentPrice: 0.0,
    newProduct: false,
    idCategory: '2',
    nameCategory: 'Shirts & Blouses',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
    id: '6',
    name: 'Olivier',
    image:
        'https://s3-alpha-sig.figma.com/img/744c/af4f/8cbe22e0d501d66b730b03c24f793383?Expires=1647820800&Signature=bgrUpOwrsj9ZJ6eZ5s6P7wwhCdK18lsjehZpvZAUmk7TCZqbtYlDcdAEaIXLCJe8mYYmhtNtZobck1eO4hqqZQo3RcfUDlG-r1fThegfjolbWqozeUXVC95ICP-4mIl9vqe6qCubsEiP32neuBs4xmZIIx1-0Yr8zwBVesPfBOoyVciaMGqWnx6ONZfprrG0uaO7eKD7cYSgyMKG18qEogfMgB5ReZ~BY8TUzCLA-Y7lnmFkqhfaiga1Kb5fSwEJ1Ex9Ua-yqNbW6qfJsLiOEHAsLtaUrtX1fFLvzF6bN2yzPjlwqwn1LUocQ058pYmrtA3LN1H9PibHZfUoSfl7OA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 10,
    type: 'Shirt',
    color: '',
    size: '',
    originalPrice: 52.0,
    discount: 0.0,
    currentPrice: 0.0,
    newProduct: false,
    idCategory: '2',
    nameCategory: 'Shirts & Blouses',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
    id: '7',
    name: 'OVS',
    image:
        'https://s3-alpha-sig.figma.com/img/6e2a/6075/d2aebb9b52db31deea621f309362bab4?Expires=1647820800&Signature=aqN89VFQDTRIiyQ4NhkQyhfcIF0-knND2qGxxXlJ4qtW5egk8r5UENVFW8zJ3M35zj1S1n3UDw~bHNbiWpRXDVEH5dh2k0VWXchFtSFURnqOvIzraT2wbeeeWbuNJDEIEiL6-30t-X0VovVXIWKAissSHQGF5vjy7xWKN8ctkQHSKR04EERlrrN--ZMKMCAB0MSBBGLOjNpf9Xzj0-qeGG7W5znXKbXa24n94o6QxbVcUYX2z5uD0ZcskL60BpCW~mpupOjZKuA~hmOOvTBDz7aX-4CxFBt2MbvBv2jMJ3I2R9wf9FwhdPIBQC1yG7dDkkARW38EWBqjIQQuGYIa9A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 0,
    type: 'Blouse',
    color: '',
    size: '',
    originalPrice: 30.0,
    discount: 0.0,
    currentPrice: 0.0,
    newProduct: true,
    idCategory: '2',
    nameCategory: 'Shirts & Blouses',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
    id: '8',
    name: 'Shirt',
    image:
        'https://s3-alpha-sig.figma.com/img/42ba/43af/9999902f1278824120c0dec8686180c5?Expires=1647820800&Signature=C2FNfAfrLsriEztATuFcatPXA04TberjI1AaJybDvRIy47OdYAMWXV80XdXIUtmQULHAoOQCWYO8Lmtc9VAUOy8EoIftmFZgeMX55cQGDAtCFlkVjK47uapNKUKW5p5doGE4vx4NnpbJdANUZ0REtx0FdhmcvvxYK-WXaIlfh8N5IzLY8lmur-lb0MY6JF6-nH5yAh3bVNLy25fNC-TWO4XwAbbVtwVm-HMjrtMHe0FBvmN1OwkXq2H8EjyulMqaLA9Ae6Ho~xB7OnIo1TQY1hTAFqM1wUC1OGXj-T~a8PKAEM4Ma8Ct0RuEgNrrWe8shjnviRmVWGT8ILepQWYOTA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 3,
    type: 'Topshop',
    color: '',
    size: '',
    originalPrice: 51.0,
    discount: 0.0,
    currentPrice: 0.0,
    newProduct: false,
    idCategory: '2',
    nameCategory: 'Shirts & Blouses',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
    id: '9',
    name: 'Blouse',
    image:
        'https://s3-alpha-sig.figma.com/img/1e61/4675/147da579254b3012302de5304dcb0db0?Expires=1647820800&Signature=avsQc5LYAXPLaZVi8oBT7cP8F9OkbwUHr0OFzEPGiO3986L-i13B65yZPUtrC6~nVC6F5ZkZk9aN8JeC0Esu7e1Ih6cQ1vhSjh6ZA5TmuxPWOkVdpAxcCacEQZvivsxlWN2VHB0ARvm0vvHp37fqqk09KTI1DE7E1M8vew0TXSXgMr-ehmJZ8fhgcFJxiB4PZkvLciBd1eCDnxlUbFDWFyFwPgNjb7hEqFtuYk0L4N3nD5xOOk4bn-KPTRxwoFcb2WbqDJkJna-EpM~zyg95vTB-2~N~L8YPAJp3qMTXtIdTxCWCgCwa1iqofli5yE2Cw0u2YYLfPUwm9qpWXhi2vw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 0,
    type: 'Dorothy Perkins',
    color: '',
    size: '',
    originalPrice: 34.0,
    discount: 0.0,
    currentPrice: 0.0,
    newProduct: false,
    idCategory: '2',
    nameCategory: 'Shirts & Blouses',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
    id: '10',
    name: 'Dorothy Perkins',
    image:
        'https://s3-alpha-sig.figma.com/img/f3e5/6877/4c7febc96d7bcbc94151195223b06a90?Expires=1647820800&Signature=fVuCi8yX0AAQQmMKDl6XsXgBTsAaVI1wNv5vXX-oniq2AD~CHy5atboqSbH97iL78Jtxp0UrGJWOqbauwbbB43exCRaZBb07AfHkp79ilMDJN4QOQsvB-4NCGi4qbf2jyya8b8mvWWPrKiVVDWmEg-BbaOE9n8RhcEUgSo31FMTNEyEwHo9wV8G~cl~~tVbItQFbFNfUjPZXe1Uu~UQNzczuYPKOg~MdBq0OmeicS6Xyow3QS0ibUKxSX9Oey2Gfcy-3eN~AXjWvhg5-SJ1yN8TueG57aeHr0Noe-b2rZi-BFG2NKRNT7pfWLud-F3mLyUWRGTW-avIdQbR5Lo2RuA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 10,
    type: 'Evening Dress',
    color: '',
    size: '',
    originalPrice: 15.0,
    discount: 20.0,
    currentPrice: 12.0,
    newProduct: false,
    idCategory: '11',
    nameCategory: 'Dresses',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
    id: "11",
    name: 'Mango Boy',
    image:
        'https://s3-alpha-sig.figma.com/img/538f/4b85/9bcd988842505bc7673b2c97a627a114?Expires=1647820800&Signature=cCqed4V-6xtsYehsAWvZ8Qb-0DgxOuY1VBOmYWWlVUTDBX764xlHxh31TYjSDU7ebdLMMyt8W8XmYCTbO6lebEZ8ITGEKxqR-NIZ~~PB2LZGFEiptlctkoaVN0n7faq98Nnd5ekDDRdum1h8KWqYu8CHm44IqOI4KlANNMeQUg1XsSyK6qA~kZgPvcevLYtcCHW2pihMvMmmPnBcZcSmT2sWbvMmrEkIMEb7RQ2WsbPGkoFgLztVICjELgKQVXhlpt1rJHgw-d1qAVjrqX5jXvH0KeZA77rttFNdqKm7UV1EJC8imZSLWZi1qBe9he-9vtQbMbw-ZwQ-ChH3dlmKtw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 0,
    type: 'T-Shirt Sailing',
    color: '',
    size: '',
    originalPrice: 10.0,
    discount: 0.0,
    currentPrice: 0.0,
    newProduct: true,
    idCategory: '2',
    nameCategory: 'Shirts & Blouses',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
    id: "12",
    name: 'Pullover',
    image:
        'https://s3-alpha-sig.figma.com/img/fa11/6ce9/5fe27c6f7b496e811aa346d85d4408ce?Expires=1647820800&Signature=Dlxu71H84XROgBVtB9IOqtVvht-i-DPiUp9jFDQ7wqe5mOsL6qI-a9N-izCZ1R-Lr4MAVXu6Phpat~WL4fKZFeITaoHv3U3jqhCSzzU8bhBu9VO2KiJJEQkpHK3yT7JP-45NJn7h3051-NQJ4BArCkkubiavxhn2xkgj5zLlI35C2qQ~vy~a-xBWJ3Ymh5MHJGtg1CofafPDYWBi86FeoCQdgNZN3ZygA9qFpJSG8miG0~uaHjXU-DAtaJkJ8zcc5yBX--Xa3UvW308OMJ9aH4zt1unAQFByjDDFHWGMjC5-LMShe8J9py4u8ncQAgIZxNm-VMTVgK5HZX29CJucVA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 3,
    type: 'Mango',
    color: '',
    size: '',
    originalPrice: 51.0,
    discount: 0.0,
    currentPrice: 0.0,
    newProduct: false,
    idCategory: '2',
    nameCategory: 'Shirts & Blouses',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
    id: "13",
    name: 'LIME',
    image:
        'https://s3-alpha-sig.figma.com/img/1821/5f62/e259b4c9081785e2fb7f4b553d1a8023?Expires=1647820800&Signature=R2LMhOzu0G5qsGFpxrOFdHnzbbE~iA1nAY19-trgvW6SwHIzj2j-5EDc057~8eiKo5MISsUrH0eYcYsSedSbt1jE9xc7QngzcgEKG0g1-bgRj15FdqCvn4vRyIA0RnB6JOqXtWbAXx8pWQ~qz0~gF93Nyk-2D4F94rCOBc~D1k-ogGQkiBHuTeDIWHMJtR9DuzsCUg19NpVgcojyp12jGU5ZD1C-dPYL3Sos82b0LAIRWbt0oBNX9Ito8418VMq9UdERhQGozMmETJqjzcPib976cZqs-TbD-aWQrPJ-OLRUGxlF2Lpye0msnCNLJSyT7OODngQstNWdudlcilEVog__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 10,
    type: 'Shirt',
    color: '',
    size: '',
    originalPrice: 32.0,
    discount: 0.0,
    currentPrice: 0.0,
    newProduct: false,
    idCategory: '2',
    nameCategory: 'Shirts & Blouses',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
    id: "14",
    name: 'Berries',
    image:
        'https://s3-alpha-sig.figma.com/img/6011/aa7a/e269bb70fd8c136d1d0733c8ce6f245a?Expires=1647820800&Signature=aE1Czpj2wCzK01LfFBxR~BF2ht-kobU4CEiGBVPRIYGR910HCWPFDy8QRCMZQ9yzBK-G4CgZhmZQeSocoI9Crgn-MyqI~3jfdGTOrumEH~eid3ZPhEUGu4xCiVuVGbkMXKVZU5NoXXQnFUTXO4QCWecy8GmbYTWGQYD73jAvbhxrfzxAiMJsEdtH8~YG~cmPBI0Hca1FDU7b7xeTMJaeHtMsQ6RVJpmiqTYvOLeXHtUSs6f~~oZYDXri9sC5oZK4lJts7UmjOkW4~1LtyTMvYvpnjR-nZ9onV302MKFJ5qhmq6g0p9XCJThnycdiZCldWJMivA3A7GXJKtVbpPH4JA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 0,
    type: 'T-Shirt',
    color: '',
    size: '',
    originalPrice: 55.0,
    discount: 30.0,
    currentPrice: 39.0,
    newProduct: false,
    idCategory: '2',
    nameCategory: 'Shirts & Blouses',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
    id: "15",
    name: 'Mango',
    image:
        'https://s3-alpha-sig.figma.com/img/5e93/8ec8/ffc8353c2e4119cf43ecf6db7e381d9d?Expires=1647820800&Signature=GCgnBGje4Yw65jleX8sykJpTKQbObxQUSZXFBa5IePF67xoadVrB7ve35NNHj43AtS7AXKoiEncWL8h9cCkA98G7k3ZUCiyfW4U8tuIwA3X2VYJ3gxY4VqvCrPu9L5ERiBhba29jNwQZC4JEXntXJNueEpiF1JApKRjUaNCybmqrj05Ox7vyLWjrNMUDkpQ2W5NUEs3wjV8pmXGJcwnu37GYhEt9gp6uT9HM80O3rPl2IefcsfGt0jCzaPOzDZPbsr9-qc2KRIVQrC3r9eJ5inxzTY2wR0KwK1xkMvUIBbGQleW7-0gPAc8OZiy7j0ztlQHwfFylohTa1dhxXyWswA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    star: 3,
    type: 'T-Shirt SPANISH',
    color: '',
    size: '',
    originalPrice: 9.0,
    discount: 0.0,
    currentPrice: 0.0,
    newProduct: false,
    idCategory: '2',
    nameCategory: 'Shirts & Blouses',
    soldOut: false,
    amount: 0,
  ),
  XProduct(
      id: "16",
      name: 'Mango',
      image:
          'https://s3-alpha-sig.figma.com/img/5e93/8ec8/ffc8353c2e4119cf43ecf6db7e381d9d?Expires=1647820800&Signature=GCgnBGje4Yw65jleX8sykJpTKQbObxQUSZXFBa5IePF67xoadVrB7ve35NNHj43AtS7AXKoiEncWL8h9cCkA98G7k3ZUCiyfW4U8tuIwA3X2VYJ3gxY4VqvCrPu9L5ERiBhba29jNwQZC4JEXntXJNueEpiF1JApKRjUaNCybmqrj05Ox7vyLWjrNMUDkpQ2W5NUEs3wjV8pmXGJcwnu37GYhEt9gp6uT9HM80O3rPl2IefcsfGt0jCzaPOzDZPbsr9-qc2KRIVQrC3r9eJ5inxzTY2wR0KwK1xkMvUIBbGQleW7-0gPAc8OZiy7j0ztlQHwfFylohTa1dhxXyWswA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
      star: 0,
      type: 'Longsleeve Violeta',
      color: '',
      size: '',
      originalPrice: 46.0,
      discount: 0.0,
      currentPrice: 0.0,
      idCategory: '2',
      nameCategory: 'Shirts & Blouses',
      soldOut: false,
      amount: 0,
      newProduct: true),
];

final List<XCategories> listCategories = [
  XCategories(id: '1', name: 'Tops'),
  XCategories(id: '2', name: 'Shirts & Blouses'),
  XCategories(id: '3', name: 'Cardigans & Sweaters'),
  XCategories(id: '4', name: 'Knitwear'),
  XCategories(id: '5', name: 'Blazers'),
  XCategories(id: '6', name: 'Outerwear'),
  XCategories(id: '7', name: 'Pants'),
  XCategories(id: '8', name: 'Jeans'),
  XCategories(id: '9', name: 'Shorts'),
  XCategories(id: '10', name: 'Skirts'),
  XCategories(id: '11', name: 'Dresses'),
];
