-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Material" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "english_name" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "japan" TEXT NOT NULL,
    "parent_id" INTEGER,
    CONSTRAINT "Material_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "Material" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Material" ("color", "english_name", "id", "japan", "name") SELECT "color", "english_name", "id", "japan", "name" FROM "Material";
DROP TABLE "Material";
ALTER TABLE "new_Material" RENAME TO "Material";
PRAGMA foreign_key_check("Material");
PRAGMA foreign_keys=ON;
