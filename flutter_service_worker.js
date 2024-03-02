'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "cc132570d6d238130e38adc59e1f998d",
"index.html": "ec51421f8baab26351ba5d18f8dd9009",
"/": "ec51421f8baab26351ba5d18f8dd9009",
"main.dart.js": "c649bf40e2718c43c0c63b673fd5cc07",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "6d26affd93f0a46e016da5d20f4bbde9",
".git/ORIG_HEAD": "a6f611d8310bace91e591191471cf230",
".git/config": "fd48e3876f55c76ac0d4db2c6f4bcabe",
".git/objects/95/d3248db1c7678d00199a20729b91fb9c152063": "111a3e3898ed894acfa06c32afc01a31",
".git/objects/92/befd60bcf9e900dabdd52681ea1f4cdee101c0": "6abc33b6b5a52018dbea71da4655ed0a",
".git/objects/3e/1f2c38a0d6850cb3ae93431c6c9ca667ae2d85": "2a084d6eb5b94df6d0288156040d63cd",
".git/objects/68/67832ceae9d37b7dc6a74bf123d3938df2047e": "893135c68d772ed9c00cb35089c45738",
".git/objects/68/9459d8b002e50d122087c6ea437da48f8115a1": "648d1bb688cd7844cd69ae9d532fe9fc",
".git/objects/03/50e3809130a070c3c4c603e41bb39f6b5e1187": "a95bb3946156c6869112cb3f0c977989",
".git/objects/9b/9b328149b0410fe0331bc0604a226bc5927399": "788274030715d5cfb83a3e4c2bfe3853",
".git/objects/9e/81da550b7a0dd12fabfdfed931e1440360bf8f": "06913e1c887fa0f0aaabb5ed58bcc380",
".git/objects/6a/edebb838a9fd0973e5a1b90fbf1ca59f17bf38": "a1dca5bfc9afe77662bba03cae3173f6",
".git/objects/32/1a241e016aa97dcf5947b37fa4c468f8f4c1ef": "d203c9bb6e83e0cb5f38e60de5017ab1",
".git/objects/35/91af41948adc8001f3586d76b91181311953fc": "c91d33b29071dcff3b2b3385383761cb",
".git/objects/56/0bcf53a6bf91e8d5867a06fc9fbcdbdf98a365": "dfdb850217950f28d6586537a91b99e7",
".git/objects/51/fe0560eb59c039d58d0303dd63d8e333089ecd": "939b9d5f38f2a3a2bebdfebb8cb31c6f",
".git/objects/3d/ed09192d9e5d85958954998dba504357e00588": "175955c9fc7a59b4517b2789d4cf8c5b",
".git/objects/94/bcf553999f7a4fa82e25b0a08905b2019df642": "57debc70f1eb677d962da6878e5f6370",
".git/objects/05/80e2fa0a1daa8d28e81f1b113104d31e05c186": "84a0bcd2af93bc5fe2a2f753a890f25a",
".git/objects/05/927fb8458378dfed1735c6f43a36082b7343e3": "8feabc3a28ec9ce59eaad45607469163",
".git/objects/9c/b38a0576bc4bd8dd8fa6aa02e65634b3e7682f": "00df84f712d43a99ce78bf0a129083fa",
".git/objects/02/842d69ee38d5b7e4ba6ed21c124ea4dafe04e7": "dbf4a59cd13dddffb50f62aecdfd70e9",
".git/objects/a3/2f9f545bb0c4ac3bb97118ea5e82b1798a69d1": "ad37e46d4c5de18d74d30244c7293c4b",
".git/objects/ad/b1d06e939197d00948c9b252464e61c479e2dd": "79b5f537a414a09e8d9975908d6d2472",
".git/objects/bb/ac29f5ef7a40bf14c0901bc1457724156bc0de": "1393f20f0610cabefe2d4f45865b0f54",
".git/objects/d7/2c11112c7cb4e2ce754bc41470f9b829a2d00a": "d7280a766a5d6033f187d874a92b5ad6",
".git/objects/be/5fc29935d6d42ee41fc1a4eaa7ad78486ec408": "16a46c5505290a6449c3fc062f634a79",
".git/objects/b3/d84c35abbcc8c1475ab45a2e937fe51b809a12": "586452bb8641c4e72d83e4685650922d",
".git/objects/df/ee325e47642d61e4f3469e8ef0b97dd5f7073b": "b6bea4644e377d91344569072ff5b67e",
".git/objects/df/c7e2fc59dfbfaf577dc2777f6bb910a6d04d1f": "1a3069e2a129bcd83854f2d53efd65b2",
".git/objects/df/7d2dcb89ab89da87467c0e1059b38c8d8f9296": "a44162ff357b024e4638ab18a9bb01c7",
".git/objects/a2/265b8b31d649f408550eb53ce60afeb878abc5": "201dacefa0830d568f08bf7af1bb82a3",
".git/objects/a5/530285279416be64c13abff89fa9194e9fa598": "08d863cfc3b4e671c65382e71b769995",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d6/fe781e60ac8ef827946f50acb1307c143bb026": "63f8890aa8f6d78781b2c02147a56182",
".git/objects/e5/4e70079bfe016e0db6803844e7da06f537b80d": "67aac4c5ab7d5fd1b97595095c695162",
".git/objects/e2/74337158251e0d2e4d2b28fdad2f20f6bef35d": "dc5a14ef30ffb5e0a521c2a1b2815558",
".git/objects/e2/a8a99bc64b057fb34e4be3ce717cd8aaef22f4": "940d710e7f57918cc7f6f871439d2bf1",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/eb/a470c0e5c8781a104c4788be0fb9ef88b11fb9": "154ad1f5840cd1a5585a99d4011ac766",
".git/objects/c0/68f944740ba3ac9fae800f5d573c5f6f4e71c7": "a761784cebed528ed39f4a5a4f8ef834",
".git/objects/ee/e45ba97c0ff8a2304c14a23874170105867c0a": "4a45053c3102a273219b7e7682995b85",
".git/objects/ee/7eecd21283de79813a26da37ec462f5b883bbc": "1a8bc6dd59cba27b7fc12ca59ec0d137",
".git/objects/fc/de1bb3df8c330568f07ef326d43d8ae3562897": "6e5bf2450330342c243afc3723b9c27e",
".git/objects/f5/deb577618a5ae36556f8ce6445db4a25971a0a": "2271cbbf595caabaa90a94e94a0512ad",
".git/objects/e4/296a0ef66a4499184ca292b349e21eb0e30c47": "bceeffad5114ae5cee122430026266b9",
".git/objects/ec/0d30503d7cbf1d7dcc26b12318a1fa6bb0bedc": "888f65b2ae7646044c9a76d641ab979e",
".git/objects/ec/1a2d172e9fdb1e666e1d9b50a4a83d98b43c29": "fd2c28989673a946adc88d0e0f7e5a4e",
".git/objects/18/13d882e7325318ba1f192cca75c85da3202d3c": "ce9b418f4e1e32b238452fa07f96bf06",
".git/objects/7d/c9cf22eb8395f30693122cbdf8e99fd9c292a4": "190bd7964a6fa22fdb7cec02ce13703e",
".git/objects/7c/90a5472ce15a1470b83af19f10b5e48cdba371": "e0bbf9f611a932d1aade20a858a3c9c7",
".git/objects/73/d58cbac5ec8762e994b1078984f14920a7fb44": "80838b5517f9f540bc463c5587f590dd",
".git/objects/17/2e2498827d740f3c06f41877ebdeba886246d3": "3aee8515401ed079566640f3c9b68133",
".git/objects/7b/b6575c2448d79a200b5e2b50b432547f343e5e": "a4bdfe85c894ef45eb95211e81d4a87c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/19/d4d427514e0e2fbaf158da035e76c7fce2d537": "b0ea41ed66b9afcecf1155f3aac14c0e",
".git/objects/4c/3f17beaf45f0a2ccaec2a6ea4d60642f3fe27f": "f8e91bb85951dcd447dcee5a03e7b9ad",
".git/objects/4c/a2a7c226d2c3e26f0b9dde74214486d0baa896": "734657b1f27c72d07dd9e52a25c020c1",
".git/objects/4d/7dc959d40dea6ce0342469a5fb12db3b61edd1": "2cd66be7af6b1fd92471e4fc65a6601a",
".git/objects/81/716acecf59a1113570e598177e50fcb14194c3": "091c6874ef6223afb8d294dcee31061d",
".git/objects/88/865a732a3484f80acadbc45f10b8def3977d02": "20cd75c3b948cbe9412847e517d008df",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/07/cd3deedc09d6185cc12b3aa9ec4134397d20d3": "ee9501a5575733dd4172d34ec0c27a1e",
".git/objects/38/2293d22f00426b3b463a38bbecb52dfb7e001a": "e464c6b15bc1be8177b6bab951038fe6",
".git/objects/5d/072c4822ab7e72d27e56fe3cbd6eff62dfc5ea": "270b90323b7718f81c86cef8b51c7e38",
".git/objects/65/288dcaab5c5efa56386b0102b94f291dba7767": "2ae93a53672b1f60c8e826b52ac91f74",
".git/objects/53/7807567919e88db2866b7825339c57e94c24d8": "970aec5149a3dbe9370a9dc982cdd022",
".git/objects/30/595072ca1015520dda6755872d1d097a81cf66": "a537e26cb8429c60ef109886181087d4",
".git/objects/5b/dce7fbba2ec733b053ec9135d239508bcd813e": "898987b892fa9d076131081850c1d74e",
".git/objects/01/bcca7d1c23955f7aeda6a269b1b7f540802096": "635a6822e2a56f7f333d54c66b0234db",
".git/objects/99/6978591c0001a2ab99b2bf1db3d5c75500e9ad": "ebf26ebcd2a370d4548a8334650a155f",
".git/objects/55/11ec87d19531b6f23a44ce4c5af0f7803c5ac8": "3337632b42b5451d8aeab6b61ed28d9e",
".git/objects/63/d1411b4115cd6f3561c59862866640bb629699": "6f263a04e03cea4ddddab5cffac22ddc",
".git/objects/d3/efa7fd80d9d345a1ad0aaa2e690c38f65f4d4e": "610858a6464fa97567f7cce3b11d9508",
".git/objects/a7/ed3a77c0f04c43349d1530b524de39ede07795": "5f05e8d8fd4f75771601b8e31f8a3dad",
".git/objects/d5/b54bd4a898b373f82bb1fa52b9580e7a976e3e": "943e27e1d359e2bc22daf20c70287c19",
".git/objects/aa/8cb032d8c3a32382058004b564b160ef22d3e2": "cf28d8c9c94f0f6f19f7921d8bb8235e",
".git/objects/aa/9033a801f73539a025d9f4012fa823c27ff3b1": "6489b5eb717a3de0e8081066d4570d80",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/d8031b5392778393bd342c12427516166bb730": "0f96b55ec49473d3e178568f493dadc3",
".git/objects/a8/e8bb62c64b82f26aefbe2ab5265d4a6a95fe31": "0cb59ac5f5ba9e2e6e117531c1f4e1da",
".git/objects/a8/234e78324011301c932efde8dd789fba10495a": "5ad9ca983e505191e13f526cf3be6ade",
".git/objects/a6/b62473aba83aa8d6c5f0e0650fe8cf116a1b2b": "adb57dc5d8036794579895c5dc953ea8",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/9cd20e93aadaca1fe0ac1f49bc59263c80e0f1": "b77f1bf407d8f767bcc10de5ea1fd2b1",
".git/objects/ef/ddc83415f34cb2ca66704126323cca45d43981": "b656859c40b233f704bed382b7882445",
".git/objects/c3/8f3dc06b4ba67e9fa9f6146184140f72a850bf": "66de2ff17901d61be9df53ec99914e2a",
".git/objects/c4/f24f5722b91e069cb8a6ddeb7d921199432b31": "94ecb4ee65c3a34e094338163f5ac1b2",
".git/objects/cc/91f8af31d6c27d4d063b4211c813b40756ce64": "611d171d809b47526acfdf9817a3e6c3",
".git/objects/e6/b745f90f2a4d1ee873fc396496c110db8ff0f3": "2933b2b2ca80c66b96cf80cd73d4cd16",
".git/objects/f0/3c8bc0bff9bbafd3ca66b1957ebc8486bf9722": "f2f9edbd7a4eea990e03396a892f6ec8",
".git/objects/e8/55dc987b0db3ccd24a8869a087233a0e124f27": "9b242467f4dfe05ce7d2727a68a1ea66",
".git/objects/c5/dfdb7679899c895750b30e858988c4e194970f": "3fb85d43ae8865a371ac8485e2715610",
".git/objects/c2/1a396b583cbc6d863e9ee1d20683b4489b8cbb": "e094ae64d692a53c163c279767ad6f5c",
".git/objects/f1/b405ec4c39438da927d245184b3c567489a9e5": "727b9ae57aaf5e29df93744073f09721",
".git/objects/cb/f44db93188aa3f540453461f19b1f355e8f7f8": "f066f0813d8c013a38687ef90bc43207",
".git/objects/ce/56883a324842ce3b3db65f87406bd68856613c": "242122bac2b350e8c4c1b2b9d67af819",
".git/objects/e0/d751063cc764d12562964dd2219f4867c94ac7": "0cb5ec82682c6675871381d96c70a124",
".git/objects/2c/37c1a9d6671446ea96c901b7b06a81d30ceb32": "2517d190d990f3f304cfa40660efe9d5",
".git/objects/2c/7e3ab422b965d7cd692601f74b92b8700bbc5d": "4fe5d586815d783d85e464025a75703c",
".git/objects/83/0e3d19e7f2ff19bbb4b955e3a38e3328837e12": "4412f19a8aebd49e1c2fb821b641e232",
".git/objects/1e/6cc6d7b4e538b03df6a1a7e46d2ace91194912": "96587ed06d54c2d12d9b8be0ccb9bf81",
".git/objects/4f/aedfd24430a283172edddd126c4705dd7de3fc": "1b1e4e9f5643b5591facca6b074a2da4",
".git/objects/71/785f5f76134822fcd6ec2ccfc0b34254eaef12": "861798b00203b7d8c23bb614f4de9f3c",
".git/objects/76/8d9b59aad470ccfb4f16de46e3cac1429356e3": "565acdd7efde4fa36a5a688c1c04b4fa",
".git/objects/49/a7dcbe6c7a7c1ab3e1f907e3216c30ae6ac5eb": "f6986fbe49f40d9e69a23b6436887fe4",
".git/objects/2e/467e18aad993965bdcb181444351e4025ecdbb": "e50ecb270f8421cf3b88bd01df8b37ff",
".git/objects/47/9f5a46d82829ea082cb10c1db0b1009ced7f50": "65686180aa2821b6d815a52fdf0465ae",
".git/objects/7f/9153d28e53abad0ef0558c6a8a72fe36716137": "868356e001fc05d0390ba9ced73e2056",
".git/objects/22/b853f42937053839f64897a5e2219456bdc0b6": "77dc9a6e3035a388abb4de624d699d55",
".git/objects/22/2198e5b658e52b1e8392fa85f81b5b0ad89699": "e183403d82efb1b3e5005d5a49e3526b",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "efbbb0fee3b45ef4e9e012b3839bd497",
".git/logs/refs/heads/main": "efbbb0fee3b45ef4e9e012b3839bd497",
".git/logs/refs/remotes/origin/main": "5ef81f1a67025d8c8e9255180eaff5e8",
".git/logs/refs/remotes/Joban1996.github.io/main": "54beb6874c1d78d0a8fb1476ff69e890",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "970a24962948233713406725af85c601",
".git/refs/remotes/origin/main": "970a24962948233713406725af85c601",
".git/refs/remotes/Joban1996.github.io/main": "970a24962948233713406725af85c601",
".git/index": "f83bd1d17ba56a929b560832fa6ea8b1",
".git/COMMIT_EDITMSG": "421e343e1bc2d8cd996b3a257bcdcd72",
".git/FETCH_HEAD": "24f60f6096969f9e422bc4ea73086e44",
"assets/AssetManifest.json": "760bdf5d4111f6538aa04d56c3b572e6",
"assets/NOTICES": "95656e0a7bc95cb6554881a8ca6abe47",
"assets/FontManifest.json": "012ec55fe02f1ad9b2fdc2aab6f51173",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "752e326983b8b1bac4dee32290eaada1",
"assets/fonts/MaterialIcons-Regular.otf": "a582a551b236924d6be680ffe97c74a7",
"assets/assets/images/main_logo.png": "cd59deb195029a7f246d7aa4201f14a6",
"assets/assets/images/pic.png": "351951e6a7c0d215df2d392b1576d01d",
"assets/assets/icons/maintenance.png": "02a325afe5decf9cc08c947ffd46ad61",
"assets/assets/icons/github.svg": "e94175acb667792fccb23d83e1e218c2",
"assets/assets/icons/Dart_Icon.webp": "60fbd31aec7b4a720354e75682f53901",
"assets/assets/icons/instagram.svg": "c6ec7ea81d5b081282a8bb8b912c166b",
"assets/assets/icons/mail.svg": "4e7b89371cdb7f4d532717670ef8d37d",
"assets/assets/icons/JS.png": "60f5cc7078b20ad1329443ea4ba02f1a",
"assets/assets/icons/email.svg": "5ea3ad3212c779d66e53e862872691db",
"assets/assets/icons/account-avatar.svg": "7eaab1969fd917a30628ca034b25df3a",
"assets/assets/icons/facebook.svg": "81bf79e7b83ffd4ee3a50b0274db61ca",
"assets/assets/icons/separator.svg": "6e7da10cf4fa382a2b952338375a074b",
"assets/assets/icons/develop.png": "da9ad9f1daf936707be16c391dfafec8",
"assets/assets/icons/portfolio_bg.png": "3d84fbf0ab725b9180149b36812ad67f",
"assets/assets/icons/policy-term.svg": "131cd95593fd59ffeb0b67a646b2bf77",
"assets/assets/icons/linkedIn.svg": "7aec6cdc6f6665db437fb388f83f0045",
"assets/assets/icons/linkedIn_bottom.svg": "2413cad0d92cf85be124b46ede9477de",
"assets/assets/icons/separator.png": "4f34595a6c7a3aa10fa5652b88a3dc97",
"assets/assets/icons/skew_container.png": "9da91a43a8c7aac3ff0bd4f2429ec74b",
"assets/assets/icons/privacy.svg": "7f7ae84a5b1d88ca95fb99d679c73ea9",
"assets/assets/fonts/montserrat/Montserrat-LightItalic.ttf": "e70e5d8d5129f35418fe2cfaa6132c1d",
"assets/assets/fonts/montserrat/Montserrat-Medium.ttf": "b3ba703c591edd4aad57f8f4561a287b",
"assets/assets/fonts/montserrat/Montserrat-BoldItalic.ttf": "9d216a715551da3b92a4a9b0e8994868",
"assets/assets/fonts/montserrat/Montserrat-Light.ttf": "e65ae7ed560da1a63db603bd8584cfdb",
"assets/assets/fonts/montserrat/Montserrat-ThinItalic.ttf": "59cdce8fbd384a39ab0fd14b9f693de5",
"assets/assets/fonts/montserrat/Montserrat-ExtraLight.ttf": "fca7947b08333e5ffcb80c069755b5c9",
"assets/assets/fonts/montserrat/Montserrat-Thin.ttf": "4b73d125bab54f94ed2510590c237f73",
"assets/assets/fonts/montserrat/Montserrat-Bold.ttf": "1f023b349af1d79a72740f4cc881a310",
"assets/assets/fonts/montserrat/Montserrat-MediumItalic.ttf": "2e7c02a0a4a5fd318b0625d120ad2033",
"assets/assets/fonts/montserrat/Montserrat-BlackItalic.ttf": "a943ff860cf7bda5ce3722cad5c1dc06",
"assets/assets/fonts/montserrat/Montserrat-SemiBold.ttf": "fb428a00b04d4e93deb4d7180814848b",
"assets/assets/fonts/montserrat/Montserrat-ExtraLightItalic.ttf": "e4d0c1f4d67a7f3d23a1f2f78d24ea57",
"assets/assets/fonts/montserrat/Montserrat-ExtraBold.ttf": "bd8fb30c6473177cfb9a5544c9ad8fdb",
"assets/assets/fonts/montserrat/Montserrat-Black.ttf": "9c1278c56276b018109f295c1a751a69",
"assets/assets/fonts/montserrat/Montserrat-Regular.ttf": "3fe868a1a9930b59d94d2c1d79461e3c",
"assets/assets/fonts/montserrat/Montserrat-Italic.ttf": "761177c558bb3a0084aa85704315b990",
"assets/assets/fonts/montserrat/Montserrat-SemiBoldItalic.ttf": "d41c0a341637c2e35ae019730b2d45a5",
"assets/assets/fonts/montserrat/Montserrat-ExtraBoldItalic.ttf": "e07b3f35e3e0073b2cde4c5a951cc24e",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
