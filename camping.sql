DROP SCHEMA IF EXISTS `camping`;

CREATE SCHEMA `camping`;

CREATE TABLE `camping`.`cart_items` (
    `id` INT NOT NULL UNIQUE AUTO_INCREMENT,
    `customer_id` VARCHAR(50) NOT NULL,
    `product_id` VARCHAR(50) NOT NULL,
    `quantity` INT NOT NULL,
    `total` FLOAT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`),
    FOREIGN KEY (`customer_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);

CREATE TABLE `camping`.`products` (
    `id` VARCHAR(50) NOT NULL UNIQUE,
    `name` VARCHAR(255) NOT NULL,
    `price` FLOAT NOT NULL,
    `category` VARCHAR(255) NOT NULL,
    `brand` VARCHAR(255) NOT NULL,
    `color` VARCHAR(255) NOT NULL,
    `size` VARCHAR(255) NOT NULL,
    `style` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) DEFAULT NULL,
    `image` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `camping`.`users` (
    `id` VARCHAR(50) NOT NULL UNIQUE,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `camping`.`transactions` (
    `id` VARCHAR(50) NOT NULL UNIQUE,
    `customer_id` VARCHAR(50) NOT NULL,
    `date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `total` FLOAT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`customer_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `camping`.`purchased_items` (
    `id` VARCHAR(50) NOT NULL UNIQUE,
    `product_id` VARCHAR(50) NOT NULL,
    `quantity` INT NOT NULL,
    `transaction_id` VARCHAR(255) NOT NULL,
    `total` FLOAT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`),
    FOREIGN KEY (`transaction_id`) REFERENCES `transactions`(`id`)
);

INSERT INTO
    `camping`.`products` (
        `id`,
        `name`,
        `price`,
        `category`,
        `brand`,
        `color`,
        `size`,
        `style`,
        `description`,
        `image`
    )
VALUES
    (
        uuid(),
        'Co-op SL2',
        329.00,
        'tents',
        'REI',
        'orange',
        '2-Person',
        'backpacking',
        '3-Season/Lightweight',
        'https://www.rei.com/media/bbb854f5-8d25-4426-9b4f-ad49a7d58b75?size=784x588'
    ),
    (
        uuid(),
        'Upland',
        119.73,
        'tents',
        'Mountainsmith',
        'orange',
        '2-Person',
        'backpacking',
        '3-Season/Ligtweight',
        'https://www.rei.com/media/da7819a9-26e1-4119-94bb-5872dd11b6b8'
    ),
    (
        uuid(),
        'Tepui Explorer',
        1499.95,
        'tents',
        'Thule',
        'grey',
        '2-Person',
        'roof-top',
        '4-Season',
        'https://www.rei.com/media/b44cdd28-6ea2-4d18-9e9e-88ff0a10d1db.jpg'
    ),
    (
        uuid(),
        'Truck Bed',
        1499.95,
        'tents',
        'Rightline',
        'grey',
        '2-Person',
        'roof-top',
        '4-Season',
        'https://www.rei.com/media/629cd5c5-6cb4-4b7b-9cb7-153c3f899a70.jpg'
    ),
    (
        uuid(),
        'Copper Canyon',
        314.95,
        'tents',
        'Eureka',
        'orange/grey',
        '6-Person',
        'camping',
        '4-Season',
        'https://www.rei.com/media/de1e98ea-5119-4801-8308-a1b0f80f5784.jpg'
    ),
    (
        uuid(),
        'Wagontop',
        549.95,
        'tents',
        'Nemo',
        'yellow/grey',
        '4-Person',
        'camping',
        '3-Season',
        'https://www.rei.com/media/df283e41-4403-4a80-ae75-ab5d8612dc9f.jpg'
    ),
    (
        uuid(),
        'Alpine Ascent',
        299.95,
        'tents',
        'Outdoor Research',
        'blue/black',
        '1-Person',
        'bivy-sack',
        '4-Season',
        'https://www.rei.com/media/9d49707e-2468-4421-963d-7d6baa5f4e2f?size=784x588'
    ),
    (
        uuid(),
        'Bug Bivy',
        99.95,
        'tents',
        'Outdoor Research',
        'black',
        '1-Person',
        'bivy-sack',
        '2-Season',
        'https://www.rei.com/media/5e6b8bba-584c-4c3e-8dbe-f75640da220d?size=784x588'
    ),
    (
        uuid(),
        'Quarter Dome',
        179.00,
        'tents',
        'REI',
        'tan',
        '2-Person',
        'shelter',
        '2-Season',
        'https://www.rei.com/media/a2ef84df-5e76-442c-9eb5-74dd35ef029b.jpg'
    ),
    (
        uuid(),
        'Escapist',
        239.00,
        'tents',
        'Sea to Summit',
        'green',
        '2-Person',
        'shelter',
        '2-Season',
        'https://www.rei.com/media/681bdcf0-0422-463f-8ac7-b9faa6e120a0?size=784x588'
    ),
    (
        uuid(),
        'Disco 15',
        299.95,
        'sleeping-bags',
        'Nemo',
        'grey',
        '1-Person',
        'mens',
        '3-Season',
        'https://www.rei.com/media/c56aec78-bb38-4fba-b11c-54fbb2300294?size=784x588'
    ),
    (
        uuid(),
        'Cosmic 20',
        159.95,
        'sleeping-bags',
        'Kelty',
        'blue',
        '1-Person',
        'mens',
        '3-Season',
        'https://www.rei.com/media/d273cf87-2eca-493f-80dd-7b764471eabf.jpg'
    ),
    (
        uuid(),
        'Bishop Pass -20',
        495.95,
        'sleeping-bags',
        'Mountain Hardware',
        'yellow',
        '1-Person',
        'mens',
        '4-Season',
        'https://www.rei.com/media/5d3af90d-422d-4d55-82f3-af92ebe37413.jpg'
    ),
    (
        uuid(),
        'Extreme Cold -50',
        929.95,
        'sleeping-bags',
        'Marmot',
        'blue',
        '1-Person',
        'mens',
        '4-Season',
        'https://www.rei.com/media/5ac5717b-839d-4af5-af44-a01641694cb6.jpg'
    ),
    (
        uuid(),
        'Forte 20',
        219.95,
        'sleeping-bags',
        'Nemo',
        'purple',
        '1-Person',
        'womens',
        '3-Season',
        'https://www.rei.com/media/95ff9133-f31f-4503-98d3-be91adcf51dc.jpg'
    ),
    (
        uuid(),
        'Cosmic 20',
        209.95,
        'sleeping-bags',
        'Kelty',
        'blue',
        '1-Person',
        'womens',
        '3-Season',
        'https://www.rei.com/media/0ae083cb-0011-4f39-a333-b6759b4ab788.jpg '
    ),
    (
        uuid(),
        'Bishop Pass -50',
        315.00,
        'sleeping-bags',
        'Mountain Hardware',
        'marone',
        '1-Person',
        'womens',
        '4-Season',
        'https://www.rei.com/media/89a1fc06-c688-4c48-98cc-43f9110df8f2.jpg '
    ),
    (
        uuid(),
        'Ouray -20',
        499.95,
        'sleeping-bags',
        'Marmot',
        'blue',
        '1-Person',
        'womens',
        '4-Season',
        ' https://www.rei.com/media/b5af965b-df40-4120-b424-63f71464aba1.jpg '
    ),
    (
        uuid(),
        'Kindercone 25',
        69.95,
        'sleeping-bags',
        'REI',
        'red',
        '1-Person',
        'kids',
        '3-Season',
        '  https://www.rei.com/media/9da7508a-45b6-4dfa-9db7-70226cd8a099.jpg'
    ),
    (
        uuid(),
        'Little Mo 20',
        239.00,
        'sleeping-bags',
        'Morrison Outdoors',
        'green',
        '1-Person',
        'kids',
        '3-Season',
        'https://www.rei.com/media/dfea99ec-ad91-4d66-a862-e11e437a2a6a.jpg'
    ),
    (
        uuid(),
        'Paragon 58L',
        249.95,
        'backpacks',
        'Gregory',
        'green',
        '1-Person',
        'mens',
        '4-Season',
        'https://www.rei.com/media/5b9623d4-dbd0-4479-82f7-28aa83132774.jpg'
    ),
    (
        uuid(),
        'Kesterel 55L',
        185.00,
        'backpacks',
        'Osprey',
        'teal',
        '1-Person',
        'mens',
        '4-Season',
        'https://www.rei.com/media/73757a56-2bd6-4155-b66a-1dff0a2536eb.jpg'
    ),
    (
        uuid(),
        'Baltoro 75L',
        349.95,
        'backpacks',
        'Gregory',
        'grey',
        '1-Person',
        'mens',
        '3=4-Season',
        'https://www.rei.com/media/1da83a56-b71d-480e-834e-f493ff63318b.jpg'
    ),
    (
        uuid(),
        'Aether 85L',
        390.00,
        'backpacks',
        'Osprey',
        'black',
        '1-Person',
        'mens',
        '4-Season',
        'https://www.rei.com/media/77634502-6497-4e7f-b03c-50f7096f450c.jpg'
    ),
    (
        uuid(),
        'Tempest 40L',
        185.00,
        'backpacks',
        'Osprey',
        'purple',
        '1-Person',
        'womens',
        '4-Season',
        'https://www.rei.com/media/36866269-0e27-4f0f-bab4-7218ed8d87bd.jpg'
    ),
    (
        uuid(),
        'Deva 70L',
        349.95,
        'backpacks',
        'Gregory',
        'marone',
        '1-Person',
        'womens',
        '4-Season',
        'https://www.rei.com/media/76824452-f220-4462-883a-dbcf75a34b4d.jpg'
    ),
    (
        uuid(),
        'Aura',
        280.00,
        'backpacks',
        'Osprey',
        'grey',
        '1-Person',
        'womens',
        '4-Season',
        'https://www.rei.com/media/8881edb7-3ba8-4b0c-9486-f33749755fff.jpg'
    ),
    (
        uuid(),
        'Archeon 50L',
        239.00,
        'backpacks',
        'Mountain Hardare',
        'blue',
        '1-Person',
        'womens',
        '4-Season',
        'https://www.rei.com/media/76888429-52db-4be7-a706-2ec986a4cc32.jpg'
    ),
    (
        uuid(),
        'Tarn 65L',
        165.00,
        'backpacks',
        'REI',
        'green',
        '1-Person',
        'kids',
        '4-Season',
        'https://www.rei.com/media/d7b51b29-ae4e-41b9-829f-905ac3c3bfbb.jpg'
    ),
    (
        uuid(),
        'Wander 70L',
        199.95,
        'backpacks',
        'Gregory',
        'grey',
        '1-Person',
        'kids',
        '4-Season',
        'https://www.rei.com/media/753ff793-8d5f-43f2-9f08-b74beb4cf62b.jpg'
    ),
    (
        uuid(),
        'Mag Striker',
        13.95,
        'accesories',
        'SOL',
        'ornage',
        'pocket-size',
        'flint-magnesium',
        'survial fire starter',
        'https://www.rei.com/media/b301aa46-0777-45c4-ab28-ab1f9c1ca125.jpg'
    ),
    (
        uuid(),
        'InReachMini',
        399.95,
        'accesories',
        'Garmin',
        'orange',
        'pocket-size',
        'GPS',
        'Emergency SOS Beacon',
        'https://www.rei.com/media/186f6c7b-03e1-41f0-ba4b-06a63fe894ec.jpg'
    ),
    (
        uuid(),
        'GPSMAP 66i',
        600.00,
        'accesories',
        'Garmin',
        'black',
        'pocket-size',
        'GPS',
        'Map & Emergency Beacon',
        'https://www.rei.com/media/d967ba4a-59eb-4127-9e48-9f6e364d3437.jpg'
    ),
    (
        uuid(),
        'Emergency Bivy',
        16.95,
        'accesories',
        'SOL',
        'orange',
        '1-Person',
        'adult/child',
        'blanket & whistle',
        'https://www.rei.com/media/25c53c90-2c42-4f42-9a24-060d8b0cef3b.jpg'
    ),
    (
        uuid(),
        'MC-2G Compass',
        105.00,
        'accesories',
        'Suunto',
        'black',
        'pocket-size',
        'navigator compass',
        'all weather',
        'https://www.rei.com/media/9c372f88-db67-494f-b66e-29ce7e9a6571.jpg'
    ),
    (
        uuid(),
        'Pocket Chain Saw',
        19.95,
        'accesories',
        'SOL',
        'orange',
        '1-Person',
        'two hand pull',
        'hand operated chain saw',
        'https://www.rei.com/media/aabb372a-7ae1-4b48-ba07-ee7eb26e3cef.jpg'
    ),
    (
        uuid(),
        'Signal Multi Toll',
        129.95,
        'accesories',
        'Leatherman',
        'green',
        'pocket-size',
        'built-in tools & knife',
        'emergency multi-tool',
        'https://www.rei.com/media/9b473703-9bf8-4808-b2b9-467de06277a4.jpg'
    ),
    (
        uuid(),
        'Hiker Water Filter',
        89.95,
        'accesories',
        'Katadyn',
        'grey',
        '1-Person',
        'backpackimg',
        '4-Season',
        'https://www.rei.com/media/ba1a635a-9baa-462c-9ea4-9c1238d360b9.jpg'
    ),
    (
        uuid(),
        'PA Plus Water Tablets',
        12.95,
        'accesories',
        'Potable Aqua',
        'white',
        'tablet',
        'Adult/kid',
        'Iodine & Taste Neutralizer Tabs',
        'https://www.rei.com/media/3ab991ec-a97b-464c-9f64-b2157469e849.jpg'
    ),
    (
        uuid(),
        'Stash Cooking System',
        134.95,
        'accesories',
        'Jetboil',
        'grey',
        '1-Person',
        'backpacking',
        'light-weight cook stove',
        'https://www.rei.com/media/27d4c64e-77df-47d5-96f1-5db732d8dc6e.jpg'
    );