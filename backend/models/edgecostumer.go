package models

import (
	"github.com/pjmd89/mongomodel/mongomodel"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

type EdgeCostumer struct {
	mongomodel.Model `bson:"-" gql:"omit=true"`
	Edges            []primitive.ObjectID `bson:"edges" gql:"name=edges"`
	PageInfo         PageInfo             `bson:"pageInfo" gql:"name=pageInfo"`
}
